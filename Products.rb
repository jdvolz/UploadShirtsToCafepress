class Product
	attr_accessor :name, :id, :visible, :allowedInBasicStores, :checkbox
	def initialize(name='',id=-1,visible=1,allowedInBasicStores=1,checkbox='')
		@name = name
		@id = id
		@visible = visible
		@allowedInBasicStores = allowedInBasicStores
		@checkbox = checkbox
	end
end

module ProductDB

	def get_products_by_index(index)
		PRODUCT_DB[CATEGORY_NAMES[index]]
	end	
	
	def get_products_by_category_name(name)
		PRODUCT_DB[name]
	end
	
	def get_product_by_category_and_index(cat, index)
		PRODUCT_DB[CATEGORY_NAMES[cat]][index]	
	end

CATEGORY_NAMES = [
	'bags',
	'buttons_magnets',
	'cards_prints',		
	'fun_stuff',		
	'hats_caps',		
	'holiday',			
	'home_office',		
	'intimate_apparel',	
	'books_cds',		
	'kids_clothing',	
	'mugs',				
	'shirts_long',		
	'shirts_short',		
	'stickers',			
	'valentines',		
	'internal',		
	'partner_products',
	'pets',
	'new_products']

PRODUCT_DB = {
	CATEGORY_NAMES[0] => [ 
		Product.new(name="Messenger Bag", id=18, visible=1, allowedInBasicStores= 1, checkbox="bagsCheckbox"),
		Product.new(name="Tote Bag", id=17, visible=1, allowedInBasicStores= 1, checkbox="bagsCheckbox")
		],
	CATEGORY_NAMES[1] => [
		Product.new(name='2.25" Button (100pk)', id=121, visible=1, allowedInBasicStores= 1, checkbox="bmCheckbox"),
		Product.new(name='2.25" Button (10pk)', id=120, visible=1, allowedInBasicStores= 1, checkbox="bmCheckbox"),
		Product.new(name='2.25" Button', id=118, visible=1, allowedInBasicStores= 1, checkbox="bmCheckbox"),
		Product.new(name="Magnet (100pk)", id=123, visible=1, allowedInBasicStores= 1, checkbox="bmCheckbox"),
		Product.new(name="Magnet (10pk)", id=122, visible=1, allowedInBasicStores= 1, checkbox="bmCheckbox"),
		Product.new(name="Magnet", id=119, visible=1, allowedInBasicStores= 1, checkbox="bmCheckbox"),
		Product.new(name="Rectangle Magnet (100pk)", id=139, visible=1, allowedInBasicStores= 1, checkbox="bmCheckbox"),
		Product.new(name="Rectangle Magnet (10pk)", id=138, visible=1, allowedInBasicStores= 1, checkbox="bmCheckbox"),
		Product.new(name="Rectangle Magnet", id=137, visible=1, allowedInBasicStores= 1, checkbox="bmCheckbox"),
		Product.new(name="Mini Button (100pk)", id=143, visible=1, allowedInBasicStores= 1, checkbox="bmCheckbox"),
		Product.new(name="Mini Button (10pk)", id=142, visible=1, allowedInBasicStores= 1, checkbox="bmCheckbox"),
		Product.new(name="Mini Button", id=141, visible=1, allowedInBasicStores= 1, checkbox="bmCheckbox"),
		Product.new(name='3.5" Button', id=203, visible=1, allowedInBasicStores= 1, checkbox="bmCheckbox"),
		Product.new(name='3.5" Button (10pk)', id=204, visible=1, allowedInBasicStores= 1, checkbox="bmCheckbox"),
		Product.new(name='3.5" Button (100pk)', id=205, visible=1, allowedInBasicStores= 1, checkbox="bmCheckbox")
		],
	CATEGORY_NAMES[2] => [
		Product.new(name="Calendar Print", id=74, visible=1, allowedInBasicStores=1, checkbox="cpCheckbox"),
		Product.new(name="Framed Panel Print", id=82, visible=1, allowedInBasicStores=1, checkbox="cpCheckbox"),
		Product.new(name="Greeting Card", id=192, visible=1, allowedInBasicStores=1, checkbox="cpCheckbox"),
		Product.new(name="Greeting Cards (Pk of 10)", id=78, visible=1, allowedInBasicStores= 1, checkbox="cpCheckbox"),
		Product.new(name="Greeting Cards (Pk of 20)", id=193, visible=1, allowedInBasicStores= 1, checkbox="cpCheckbox"),
		Product.new(name="Note Cards (Pk of 10)", id=194, visible=1, allowedInBasicStores= 1, checkbox="cpCheckbox"),
		Product.new(name="Note Cards (Pk of 20)", id=195, visible=1, allowedInBasicStores= 1, checkbox="cpCheckbox"),
		Product.new(name="Large Framed Print", id=59, visible=1, allowedInBasicStores= 1, checkbox="cpCheckbox"),
		Product.new(name="Large Poster (23x35)", id=54, visible=1, allowedInBasicStores= 1, checkbox="cpCheckbox"),
		Product.new(name="Mini Poster Print", id=92, visible=1, allowedInBasicStores= 1, checkbox="cpCheckbox"),
		Product.new(name="Oversized Wall Calendar", id=162, visible=1, allowedInBasicStores= 1, checkbox="cpCheckbox"),
		Product.new(name="Postcards (8)", id=77, visible=1, allowedInBasicStores= 1, checkbox="cpCheckbox"),
		Product.new(name="Small Framed Print", id=58, visible=1, allowedInBasicStores= 1, checkbox="cpCheckbox"),
		Product.new(name="Small Poster (16x20)", id=53, visible=1, allowedInBasicStores= 1, checkbox="cpCheckbox"),
		Product.new(name="Vertical Wall Calendar", id=163, visible=1, allowedInBasicStores= 1, checkbox="cpCheckbox"),
		Product.new(name="Wall Calendar", id=75, visible=1, allowedInBasicStores= 1, checkbox="cpCheckbox"),
		Product.new(name="Yard Sign", id=206, visible=1, allowedInBasicStores= 1, checkbox="cpCheckbox")
		],
	CATEGORY_NAMES[3] => [
		Product.new(name="Flying Disc", id=40, visible=0, allowedInBasicStores= 1, checkbox="fsCheckbox"),
		Product.new(name="Ornament (Oval)", id=105, visible=1, allowedInBasicStores= 1, checkbox="fsCheckbox"),
		Product.new(name="Ornament (Round)", id=124, visible=1, allowedInBasicStores= 1, checkbox="fsCheckbox"),
		Product.new(name="License Plate Frame", id=52, visible=1, allowedInBasicStores= 1, checkbox="fsCheckbox"),
		Product.new(name="Teddy Bear", id=26, visible=1, allowedInBasicStores= 1, checkbox="fsCheckbox")	
	],
	CATEGORY_NAMES[4] => [
		Product.new(name="Black Cap", id=65, visible=1, allowedInBasicStores= 1, checkbox="hcCheckbox"),
		Product.new(name="Trucker Hat", id=101, visible=1, allowedInBasicStores= 1, checkbox="hcCheckbox"),
		Product.new(name="Cap", id=140, visible=1, allowedInBasicStores= 1, checkbox="hcCheckbox")
	],
	CATEGORY_NAMES[5] => [ ],
	CATEGORY_NAMES[6] => [
		Product.new(name="BBQ Apron", id=42, visible=1, allowedInBasicStores= 1, checkbox="hoCheckbox"),
		Product.new(name="Journal", id=100, visible=1, allowedInBasicStores= 1, checkbox="hoCheckbox"),
		Product.new(name="Mousepad", id=3, visible=1, allowedInBasicStores= 1, checkbox="hoCheckbox"),
		Product.new(name="Pillow", id=125, visible=1, allowedInBasicStores= 1, checkbox="hoCheckbox"),
		Product.new(name="Keepsake Box", id=86, visible=1, allowedInBasicStores= 1, checkbox="hoCheckbox"),
		Product.new(name="Tile Coaster", id=37, visible=1, allowedInBasicStores= 1, checkbox="hoCheckbox"),
		Product.new(name="Wall Clock", id=49, visible=1, allowedInBasicStores= 1, checkbox="hoCheckbox"),
		Product.new(name="Framed Tile", id=147, visible=1, allowedInBasicStores= 1, checkbox="cpCheckbox")
	],
	CATEGORY_NAMES[7] => [
		Product.new(name="Boxer Shorts", id=15, visible=1, allowedInBasicStores= 1, checkbox="iaCheckbox"),
		Product.new(name="Classic Thong", id=80, visible=1, allowedInBasicStores= 1, checkbox="iaCheckbox")
	],
	CATEGORY_NAMES[8] => [
		Product.new(name="Audio CD", id=93, visible=1, allowedInBasicStores= 1, checkbox="igCheckbox"),
		Product.new(name="Book", id=97, visible=1, allowedInBasicStores= 1, checkbox="igCheckbox"),
		Product.new(name="Data CD", id=94, visible=1, allowedInBasicStores= 1, checkbox="igCheckbox")
	],
	CATEGORY_NAMES[9] => [
		Product.new(name="Bib", id=73, visible=1, allowedInBasicStores= 1, checkbox="kcCheckbox"),
		Product.new(name="Infant Bodysuit", id=72, visible=1, allowedInBasicStores= 1, checkbox="kcCheckbox"),
		Product.new(name="Infant/Toddler T-Shirt", id=69, visible=1, allowedInBasicStores= 1, checkbox="kcCheckbox"),
		Product.new(name="Kids Baseball Jersey", id=136, visible=1, allowedInBasicStores= 1, checkbox="kcCheckbox"),
		Product.new(name="Kids Hoodie", id=133, visible=1, allowedInBasicStores= 1, checkbox="kcCheckbox"),
		Product.new(name="Kids Sweatshirt", id=135, visible=1, allowedInBasicStores= 1, checkbox="kcCheckbox"),
		Product.new(name="Kids Light T-Shirt", id=70, visible=1, allowedInBasicStores= 1, checkbox="kcCheckbox"),
		Product.new(name="Kids Dark T-Shirt", id=181, visible=1, allowedInBasicStores= 1, checkbox="npCheckbox")
	],
	CATEGORY_NAMES[10] => [
		Product.new(name="Frosted Mug", id=44, visible=0, allowedInBasicStores= 1, checkbox="mugsCheckbox"),
		Product.new(name="Large Mug", id=1, visible=1, allowedInBasicStores= 1, checkbox="mugsCheckbox"),
		Product.new(name="Mug", id=0, visible=1, allowedInBasicStores= 1, checkbox="mugsCheckbox"),
		Product.new(name="Stein", id=11, visible=1, allowedInBasicStores= 1, checkbox="mugsCheckbox"),
		Product.new(name="Stainless Travel Mug", id=47, visible=0, allowedInBasicStores= 1, checkbox="mugsCheckbox")
	],
	CATEGORY_NAMES[11] => [
		Product.new(name="Baseball Jersey", id=38, visible=1, allowedInBasicStores= 1, checkbox="slCheckbox"),
		Product.new(name="Fleece Jacket", id=68, visible=0, allowedInBasicStores= 1, checkbox="slCheckbox"),
		Product.new(name="Fleece Pullover", id=67, visible=0, allowedInBasicStores= 1, checkbox="slCheckbox"),
		Product.new(name="Fleece Vest", id=66, visible=0, allowedInBasicStores= 1, checkbox="slCheckbox"),
		Product.new(name="Hooded Sweatshirt", id=23, visible=1, allowedInBasicStores= 1, checkbox="slCheckbox"),
		Product.new(name="Jr. Hoodie", id=103, visible=1, allowedInBasicStores= 1, checkbox="slCheckbox"),
		Product.new(name="Jr. Raglan", id=102, visible=1, allowedInBasicStores= 1, checkbox="slCheckbox"),
		Product.new(name="Long Sleeve T-Shirt", id=5, visible=1, allowedInBasicStores= 1, checkbox="slCheckbox"),
		Product.new(name="Long Sleeve Dark T-Shirt", id=155, visible=1, allowedInBasicStores= 1, checkbox="slCheckbox"),
		Product.new(name="Organic Long Sleeve T", id=14, visible=0, allowedInBasicStores= 1, checkbox="slCheckbox"),
		Product.new(name="Organic Sweatshirt", id=13, visible=0, allowedInBasicStores= 1, checkbox="slCheckbox"),
		Product.new(name="Sweatshirt", id=4, visible=1, allowedInBasicStores= 1, checkbox="slCheckbox"),
		Product.new(name="Wm Lg Sleeve Dark T-Shirt", id=164, visible=1, allowedInBasicStores= 1, checkbox="slCheckbox"),
		Product.new(name="Women's Long Sleeve T-Shirt", id=165, visible=1, allowedInBasicStores= 1, checkbox="slCheckbox"),
		Product.new(name="Women's Raglan Hoodie", id=128, visible=1, allowedInBasicStores= 1, checkbox="slCheckbox"),
		Product.new(name="Women's Tracksuit", id=129, visible=1, allowedInBasicStores= 1, checkbox="slCheckbox")
	],
	CATEGORY_NAMES[12] => [
		Product.new(name="Light T-Shirt", id=7, visible=1, allowedInBasicStores= 1, checkbox="ssCheckbox"),
		Product.new(name="Dark T-Shirt", id=152, visible=1, allowedInBasicStores= 1, checkbox="ssCheckbox"),
		Product.new(name="Colored Shirt", id=19, visible=0, allowedInBasicStores= 1, checkbox="ssCheckbox"),
		Product.new(name="Fitted T-Shirt", id=106, visible=1, allowedInBasicStores= 1, checkbox="ssCheckbox"),
		Product.new(name="Golf Shirt", id=45, visible=1, allowedInBasicStores= 1, checkbox="ssCheckbox"),
		Product.new(name="Green T-Shirt", id=108, visible=1, allowedInBasicStores= 1, checkbox="ssCheckbox"),
		Product.new(name="Jr. Spaghetti Tank", id=96, visible=1, allowedInBasicStores= 1, checkbox="ssCheckbox"),
		Product.new(name="Jr. Jersey T-Shirt", id=6, visible=1, allowedInBasicStores= 1, checkbox="ssCheckbox"),
		Product.new(name="Men's Ringer Tee", id=126, visible=1, allowedInBasicStores= 1, checkbox="ssCheckbox"),
		Product.new(name="Men's Sleeveless Tee", id=115, visible=1, allowedInBasicStores= 1, checkbox="ssCheckbox"),
		Product.new(name="Men's Tank Top", id=16, visible=0, allowedInBasicStores= 1, checkbox="ssCheckbox"),
		Product.new(name="Mesh Jersey", id=116, visible=0, allowedInBasicStores= 1, checkbox="ssCheckbox"),
		Product.new(name="Organic Cotton Tee", id=111, visible=1, allowedInBasicStores= 1, checkbox="ssCheckbox"),
		Product.new(name="Organic T-Shirt", id=12, visible=0, allowedInBasicStores= 1, checkbox="ssCheckbox"),
		Product.new(name="Remo T-Shirt", id=28, visible=0, allowedInBasicStores= 1, checkbox="ssCheckbox"),
		Product.new(name="Jr. Ringer T-Shirt", id=113, visible=1, allowedInBasicStores= 1, checkbox="ssCheckbox"),
		Product.new(name="Value T-Shirt", id=112, visible=1, allowedInBasicStores= 1, checkbox="ssCheckbox"),
		Product.new(name="White T-Shirt", id=2, visible=1, allowedInBasicStores= 1, checkbox="ssCheckbox"),
		Product.new(name="Women's Cap Sleeve T-Shirt", id=134, visible=1, allowedInBasicStores= 1, checkbox="ssCheckbox"),
		Product.new(name="Women's Dark T-Shirt", id=161, visible=1, allowedInBasicStores= 1, checkbox="ssCheckbox"),
		Product.new(name="Women's Light T-Shirt", id=109, visible=1, allowedInBasicStores= 1, checkbox="ssCheckbox"),
		Product.new(name="Women's T-Shirt", id=89, visible=1, allowedInBasicStores= 1, checkbox="ssCheckbox"),
		Product.new(name="Women's Tank Top", id=114, visible=1, allowedInBasicStores= 1, checkbox="ssCheckbox"),
		Product.new(name="Yellow T-Shirt", id=107, visible=1, allowedInBasicStores= 1, checkbox="ssCheckbox"),
		Product.new(name="Women's V-Neck T-Shirt", id=166, visible=1, allowedInBasicStores= 1, checkbox="ssCheckbox"),
		Product.new(name="Women's Dark V-Neck T-Shirt", id=167, visible=1, allowedInBasicStores= 1, checkbox="ssCheckbox"),
		Product.new(name="Women's Plus Size Scoop Neck T-Shirt", id=183, visible=1, allowedInBasicStores= 1, checkbox="npCheckbox"),
		Product.new(name="Women's Plus Size Dark Scoop Neck T-Shirt", id=184, visible=1, allowedInBasicStores= 1, checkbox="npCheckbox"),
		Product.new(name="Women's Plus Size V-Neck T-Shirt", id=185, visible=1, allowedInBasicStores= 1, checkbox="npCheckbox"),
		Product.new(name="Women's Plus Size Dark V-Neck T-Shirt", id=186, visible=1, allowedInBasicStores= 1, checkbox="npCheckbox"),
		Product.new(name="Maternity T-Shirt", id=189, visible=1, allowedInBasicStores= 1, checkbox="npCheckbox"),
		Product.new(name="Maternity Dark T-Shirt", id=190, visible=1, allowedInBasicStores= 1, checkbox="npCheckbox")
	],
	CATEGORY_NAMES[13] => [
		Product.new(name="Sticker (Rect.)", id=50, visible=1, allowedInBasicStores= 1, checkbox="stickersCheckbox"),
		Product.new(name="Sticker (Oval)", id=51, visible=1, allowedInBasicStores= 1, checkbox="stickersCheckbox"),
		Product.new(name="Sticker (Bumper)", id=90, visible=1, allowedInBasicStores= 1, checkbox="stickersCheckbox")
	],
	CATEGORY_NAMES[14] => [
		Product.new(name="Chocolate Rose", id=27, visible=0, allowedInBasicStores= 1, checkbox="valentinesCheckbox"),
		Product.new(name="Valentine Bear", id=33, visible=0, allowedInBasicStores= 1, checkbox="valentinesCheckbox"),
		Product.new(name="V-Day Mug and Candy", id=34, visible=0, allowedInBasicStores= 1, checkbox="valentinesCheckbox"),
		Product.new(name="V-Day Chocolates", id=35, visible=0, allowedInBasicStores= 1, checkbox="valentinesCheckbox")	
	],
	CATEGORY_NAMES[15] => [
		Product.new(name="Fulfillment", id=8, visible=1, allowedInBasicStores= 1, checkbox="internalCheckbox")
	],
	CATEGORY_NAMES[16] => [],
	CATEGORY_NAMES[17] => [
		Product.new(name="Dog T-Shirt", id=110, visible=1, allowedInBasicStores= 1, checkbox="fsCheckbox")
	],
	CATEGORY_NAMES[18] => [
		Product.new(name='3.5" Button', id=203, visible=1, allowedInBasicStores= 1, checkbox="bmCheckbox"),
		Product.new(name='3.5" Button (10pk)', id=204, visible=1, allowedInBasicStores= 1, checkbox="bmCheckbox"),
		Product.new(name='3.5" Button (100pk)', id=205, visible=1, allowedInBasicStores= 1, checkbox="bmCheckbox"),
		Product.new(name="Yard Sign", id=206, visible=1, allowedInBasicStores= 1, checkbox="bmCheckbox")
	]	
}

CHOSEN_PRODUCTS = [
	#[4,0],
	[4,1],
	[4,2],
	[7,0],
	[7,1],
	[9,0],
	[9,1],
	[9,2],
	[9,3],
	[9,4],
	[9,5],
	[9,6],
	#[9,7],
	[11,0],
	[11,1],
	[11,2],
	[11,3],
	[11,4],
	[11,5],
	[11,6],
	[11,7],
	#[11,8],
	[11,9],
	[11,10],
	[11,11],
	#[11,12],
	[11,13],
	[11,14],
	[11,15],
	[12,0],
	#[12,1],
	[12,2],
	[12,3],
	[12,4],
	[12,5],
	[12,6],
	[12,7],
	[12,8],
	[12,9],
	[12,10],
	[12,11],
	[12,12],
	[12,13],
	[12,14],
	[12,15],
	[12,16],
	[12,17],
	[12,18],
	#[12,19],
	[12,20],
	[12,21],
	[12,22],
	[12,23],
	#[12,25],
	[12,26],
	#[12,27],
	[12,28],
	#[12,29],
	[12,30],
	#[13,0],
	#[13,1],
	#[13,2],
	[17,0]
]		
CHOSEN_PRODUCTS_DARK = [
	[9,7],
	[11,8],
	[11,12],
	[12,1],
	[12,19],
	[12,25],
	[12,27],
	[12,29]
	#[,],
	#[,],
]
end