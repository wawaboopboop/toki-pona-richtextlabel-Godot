tool
extends RichTextLabel

export(String, MULTILINE) var text_to_parse setget set_text_to_parse

var path_to_underline_font = "_sitelenpona.tres"
var font = preload("sitelenpona.tres")

var tokipona_dict = {
	"a": "Ā",
	"akesi": "ā",
	"ala" : "Ă",
	"alasa" : "ă",
	"ale" : "Ą",
	"anpa" : "ą",
	"ante" : "Ć",
	"anu" : "ć",
	"awen" : "Ĉ",
	"e" : "ĉ",
	"en" : "Ċ",
	"esun":"ċ",
	"ijo":"Č",
	"ike":"č",
	"ilo":"Ď",
	"insa":"ď",
	"jaki":"Đ",
	"jan":"đ",
	"jelo":"Ē",
	"jo":"ē",
	"kala":"Ĕ",
	"kalama":"ĕ",
	"kama":"Ė",
	"kasi":"ė",
	"ken":"Ę",
	"kepeken":"ę",
	"kili":"Ě",
	"kiwen":"ě",
	"ko":"Ĝ",
	"kon":"ĝ",
	"kule":"Ğ",
	"kute":"ğ",
	"la":"Ġ",
	"lape":"ġ",
	"laso":"Ģ",
	"lawa":"ģ",
	"len":"Ĥ",
	"lete":"ĥ",
	"li":"Ħ",
	"lili":"ħ",
	"linja":"Ĩ",
	"lipu":"ĩ",
	"loje":"Ī",
	"lon":"ī",
	"luka":"Ĭ",
	"lukin":"ĭ",
	"lupa":"Į",
	"ma":"į",
	"mama":"İ",
	"mani":"ı",
	"meli":"Ĳ",
	"mi":"ĳ",
	"mije":"Ĵ",
	"moku":"ĵ",
	"moli":"Ķ",
	"monsi":"ķ",
	"mu":"ĸ",
	"mun":"Ĺ",
	"musi":"ĺ",
	"mute":"Ļ",
	"nanpa":"ļ",
	"nasa":"Ľ",
	"nasin":"ľ",
	"nena":"Ŀ",
	"ni":"ŀ",
	"nimi":"Ł",
	"o":"ł",
	"olin":"Ń",
	"ona":"ń",
	"open":"Ņ",
	"pakala":"ņ",
	"pali":"Ň",
	"palisa":"ň",
	"pan":"ŉ",
	"pana":"Ŋ",
	"pi":"ŋ",
	"pilin":"Ō",
	"pimeja":"ō",
	"pini":"Ŏ",
	"pipi":"ŏ",
	"poka":"Ő",
	"poki":"ő",
	"pona":"Œ",
	"pu":"œ",
	"sama":"Ŕ",
	"seli":"ŕ",
	"selo":"Ŗ",
	"seme":"ŗ",
	"sewi":"Ř",
	"sijelo":"ř",
	"sike":"Ś",
	"sin":"ś",
	"sina":"Ŝ",
	"sinpin":"ŝ",
	"sitelen":"Ş",
	"sona":"ş",
	"soweli":"Š",
	"suli":"š",
	"suno":"Ţ",
	"supa":"ţ",
	"suwi":"Ť",
	"tan":"ť",
	"taso":"Ŧ",
	"tawa":"ŧ",
	"telo":"Ũ",
	"tenpo":"ũ",
	"toki":"Ū",
	"tomo":"ū",
	"tu":"Ŭ",
	"unpa":"ŭ",
	"uta":"Ů",
	"utala":"ů",
	"walo":"Ű",
	"wan":"ű",
	"waso":"Ų",
	"wawa":"ų",
	"weka":"Ŵ",
	"wile":"ŵ",
	"epiku":"Ŷ",
	"jasmina":"ŷ",
	"kijetesantakalu":"Ÿ",
	"kin":"Ź",
	"kipisi":"ź",
	"kokosila":"Ż",
	"ku":"ż",
	"lanpan":"Ž",
	"leko":"ž",
	"meso":"ſ",
	"misikeke":"ƀ",
	"monsuta":"Ɓ",
	"n":"Ƃ",
	"namako":"ƃ",
	"oko":"Ƅ",
	"soko":"ƅ",
	"tonsi":"Ɔ",
	"kulupu":"Ƈ",
	"toki-pona":"ƈ",
	"kama-sona":"Ɖ",
	"lipu-sona":"Ɗ",
	"soweli-pona": "Ƌ",
	"soweli-suwi" : "ƌ",
	"sike-soweli" : "ƍ",
	"kama-pona" : "Ǝ",
	"soweli-sin": "Ə",
	"soweli-lili" : "Ɛ",
	"soweli-suli" : "Ƒ",
	"soweli-moli" : "ƒ"

	}

func _ready():
	add_font_override("normal_font",  font)

func set_text_to_parse(text):
	var t = parse_tokipona(text)
	set_bbcode(t)


func parse_tokipona(text):
	
	var nimi = get_nimi(text)

	var translated = ""
	
	for n in nimi:
		if n == "pi":
			translated = translated + tokipona_dict[n] +  "[font=" + path_to_underline_font + "]"
		elif n == "_":
			translated = translated + "[/font]"
		elif tokipona_dict.has(n):
			translated = translated + tokipona_dict[n]
		else:
			translated = translated + n

	return translated

func get_nimi(text):
	var nimi = text.split(' ', false)
	return nimi


