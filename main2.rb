#!/usr/bin/ruby.exe
require 'rubygems'
require 'mechanize'
require 'Products.rb'

def store_page page
	File.open('page.html','w') do |file|
		file.write page.body
	end		
end

class CafePress
    include ProductDB
# read the list of things to upload
    attr_accessor :image_id
    def init()
        @pic_src = 'c:\\CafePressDN\\pic_src'
        @agent = nil
        @image_id = ''        
    end

    def init_agent()
        @agent = WWW::Mechanize.new
        @agent.user_agent_alias = 'Windows IE 6'
        Hpricot.buffer_size = 2621444 
    end
    def agent_initialized?()
        return @agent != nil
    end

    # log in
    def login()
        url = 'https://www.cafepress.com/cp/members/login.aspx?passthru=yes'
        require 'account'
        txtEmail = Account.login
        txtPassword = Account.password
        init_agent if not agent_initialized?                    
        page = @agent.get(url)    
        form = page.forms.find {|f| f.name=='Form1'}
        form.fields.find {|f| f.name == 'txtEmail'}.value = txtEmail
        form.fields.find {|f| f.name =='txtPassword'}.value = txtPassword                    
        return form.submit()                
    end

    def logout()
        init_agent if not agent_initialized?                                    
        url = 'https://www.cafepress.com/cp/members/login.aspx?logout=yes'
        return @agent.get(url)        
    end
    
    def go_to_image_basket()
        init_agent if not agent_initialized?                                    
        #requires being logged in
        url ='http://www.cafepress.com/cp/members/imagebasket/image_basket.aspx?noprod=yes'
        return @agent.get(url)
    end
    
    def go_to_image_upload()
        init_agent if not agent_initialized?                                    
        url = 'http://www.cafepress.com/cp/members/imagebasket/image_upload.aspx'
        return @agent.get(url)
    end
    def upload_image(upload_page, image_uri)
        init_agent if not agent_initialized?                                    
        form = upload_page.forms.find {|f| f.name=='upload'}        
        form.file_uploads.find{|f| f.name=='txtUpload1'}.file_name = image_uri
        form.checkboxes.name('copyright_check').check     
        
        return @agent.submit(form)
    end
    def enter_image_info(info_page, tags=[], category='')
        init_agent if not agent_initialized?
        form = info_page.forms[1] #it's the second form on the page
        info_page.body.match(/var eiIds = "([0-9]*)"/) #find the image_id for the image just added
        @image_id = $1
        form.fields.name('eiIds').value = @image_id
        form.fields.name('eiType').value = 'IMAGE'        
        form.fields.name('m').value = @image_id
        form.fields.name('u').value = '1'
        form.fields.name('tru').value = '/cp/members/imagebasket/image_basket.aspx'
        info_page.body.match(/var eiName = "(.*)?"/)
        form.fields.name('eName').value = $1  #make sure we pass the file name?!
        form.fields.name('tags').value = tags.join(',')
        selectlist = form.fields.name('category')
		if category.length == 0
			selectlist.value = selectlist.options[1].value
		else
			selectlist.value = category
		end
        return @agent.submit(form)
    end

    def create_new_basic_shop(shopID, shopName)
        init_agent if not agent_initialized?
        url = 'http://www.cafepress.com/cp/members/stores/store_add.aspx'
        page = @agent.get(url)
        form = page.forms.name('_ctl0')
        form.fields.name('StoreID').value = shopID
        form.fields.name('ShopName').value = shopName
        return form.submit()
    end
	
	def set_store_settings(page)
		init_agent if not agent_initialized?		
		#priceSliderValue (we should be able to set this to make it work)
		form = page.forms.name('storeEditForm')
		form.fields.name('priceSliderValue').value = 15
		
		#form.submit  #click the "SAVE" button instead
		#@agent.click page.links.find {|link| link.text=="SAVE"} #clicking fails due to no href in the link
		
		#we have to do a custom postback
		form.fields.name('__EVENTTARGET').value = 'lowerSave'
		form.fields.name('__EVENTARGUMENT').value = ''
		form.submit()
		
	end

    def build_your_shop(create_new_shop_page_resp)        
        init_agent if not agent_initialized?		
        #likely requires the result
        page = @agent.click create_new_shop_page_resp.links.find {|link| link.text == 'BUILD YOUR SHOP'}
        
		#Set Store Settings
		settings_page = @agent.click page.links.find {|link| link.text=='Set store settings'}		
		set_store_settings settings_page 
		
		#url = 'http://www.cafepress.com/cp/members/products/'\
        add_products_page = @agent.click page.links.find {|link| link.text == 'ADD A PRODUCT'}
        
        # call add products
        self.add_products
                
        return add_products_page
    end
    
    def add_products
	init_agent if not agent_initialized?                
	add_products_url = "http://www.cafepress.com/cp/members/products/addProducts.aspx?migno=#{@image_id}"		
	new_page = @agent.get(add_products_url)
        #click on the link to select an image
	#curr_page = @agent.click new_page.links.find{|link| link.text=='select image'}
	curr_page = @agent.get 'http://www.cafepress.com/cp/members/imagebasket/image_basket.aspx?i=1'
	#return the first "Select" because it will be the most recent image added.  Assumption here is that 
	# the picture most recently added is the one we want to bind to this store.
	curr_page = @agent.click curr_page.links.find{|link| link.text=='Select'}
	#select the products
	product_form = curr_page.forms.find {|form| form.name=='addProductsForm'}
	
	#puts product_form.checkboxes.length
	#puts product_form.fields.each {|f| puts f.name}
	#### needs testing
	
	#ms = product_form.fields.name('products')
	ids = CHOSEN_PRODUCTS.collect do |pair|
            cat, index = pair
            product = get_product_by_category_and_index(cat, index)
            product.id
	end
	#ms.options = ids.join('.')
	#ms.value = ids.join('.')
	product_form.fields.name('productList').value = ids.join('.')
	
	page = product_form.submit
	File.open('product_add_resp.html','w') do |file|
            file.write page.body
        end
	#### end needs testing
    end
    
	def close_shop(store_name)
		init_agent if not agent_initialized?
		index_url = 'https://www.cafepress.com/cp/members/index.aspx'
		index_page = @agent.get(index_url)
		shop_list_page = @agent.click index_page.links.find{|link| link.text=='View All Shops'}
		shop_page = @agent.click(shop_list_page.links.find{|link| link.text==store_name})
		page = @agent.click(shop_page.links.find{|link| link.text=='Close This Shop'})
		page.forms.find{|form| form.name=='_ctl0'}.submit
		#url = 'http://www.cafepress.com/cp/members/stores/store_manage.aspx?storeid=#{store_name}&redirect=store_close.aspx'
		#close_shop_page = @agent.get(url)		
		#close_shop_page.body
		#close_shop_page.forms.find {|x| x.name=='_ctl0'}.submit 
	end
end

# load those pictures
# upload the pictures to the media basket 
# create a store for each picture
# bind each picture to a set of products
# set the keywords?
# SELL!
class CPBuilder
	attr_accessor :upload_page, :info_page, :info_page_resp, :shop_add_resp, :build_new_shop_resp, :new_page_resp, :cp
	def initialize()
		@upload_page = nil
		@info_page = nil
		@info_page_resp = nil
		@shop_add_resp =nil
		@build_new_shop_resp = nil
		@new_page_resp = nil
		@cp = nil		
	end
	def setup(add_pic='', tags=[], section='', shop_name='')
		@cp = CafePress.new
		@cp.login
		if add_pic != ''
			@cp.go_to_image_basket()
			@upload_page = @cp.go_to_image_upload()
			@info_page = @cp.upload_image(@upload_page, add_pic)
			@info_page_resp = @cp.enter_image_info(@info_page, tags, section)
		end
		@shop_add_resp = @cp.create_new_basic_shop(shop_name[0,14], shop_name)
		@build_new_shop_resp = @cp.build_your_shop(@shop_add_resp)
		@cp.logout()		
	end
	
	def teardown(shop_name='TESTVS')
		cp = CafePress.new				
		cp.login
		cp.close_shop(shop_name)
		cp.logout
	end
end

class Job
	attr_accessor :file, :tags, :section
	def initialize(f = '', tags=[], section='')
		@file = f
		@tags = tags
		@section = section
	end
end

def make_filename_from_text(tx)
	tx.gsub(/[\/'\s?\.]/, '-')+'.png'
end

def read_jobs(file)
	jobs = []
	File.open(file, 'r').each_line do |line|
		next if line =~/^\s*#/ or line =~/^\s*$/ #skip empty line or comments starting with #		
		frags = line.split('::')
		job = Job.new( make_filename_from_text(frags[0].strip),
			frags[1].split(',').collect {|x| x.strip},
			frags[2].strip)
		jobs<<job
	end
	jobs
end
# c = cpbuilder.new
# c.teardown
# c.setup
#File.open('new_page.html','w') do |file|
#	file.write new_page_resp.body
#end

def clean_text(s)
	[" ", "'", "/", "?", "."].each do |letter|
		s.gsub!(letter, '-')
	end
	s
end	

def main()
	if ARGV.length != 3
		puts "The usage is as follows: \n\n ruby main.rb [your_full_path_to_cpx_file], [store_name_seed] [start_at_#]"
		#exit(0)
	else
		#read path for index.cpx file
		seed = ARGV[1]
		jobs = read_jobs(ARGV[0])
		start_at = ARGV[2].to_i
		#each png call CPBuilder.setup
		def nextvs(a)
			lambda {|| a=a+1}
		end
		n = nextvs(start_at)
		builder = CPBuilder.new
		dir = ARGV[0].gsub(/index\.cpx/, '')
		jobs[start_at, jobs.length].each do |job|
			#print "#{seed+n.call.to_s}"
			builder.setup(dir+job.file, job.tags, job.section, "#{seed+n.call.to_s}")
			puts "Built #{job.file} site"
		end
	end
end
main()
