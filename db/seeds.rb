# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Tournament.seed('名人', 'Meijin Title Match')
Tournament.seed('順位', 'Ranking League')
Tournament.seed('竜王', 'Ryuou Tournament')
Tournament.seed('王将', 'Oushou Championship')
Tournament.seed('王位', 'Oui Championship')
Tournament.seed('王座', 'Ouza Championship')
Tournament.seed('棋聖', 'Kisei Championship')
Tournament.seed('棋王', 'Kiou Championship')
Tournament.seed('朝日杯', 'Asahi Cup')
Tournament.seed('日本シリーズ', 'Japan Series')
Tournament.seed('女流名人', "Women's Meijin")
Tournament.seed('女流王座', "Women's Ouza")
Tournament.seed('マイナビ', "Mynavi Open")
Tournament.seed('女流王位', "Women's Oui")
Tournament.seed('倉敷藤花', "Kurashiki Wisteria")
Tournament.seed('鹿島杯', "Kashima Cup")

Player.seeds([
{name: 'Habu, Yoshiharu', search_key: '羽生善治', category: 1, kishi_id: 175, rank: 9, url: 'habu'},
{name: 'Itodani, Tetsuro', search_key: '糸谷哲郎', category: 1, kishi_id: 260, rank: 8, url: 'itodani'},
{name: 'Watanabe, Akira', search_key: '渡辺明', category: 1, kishi_id: 235, rank: 9, url: 'watanabe-a'},
{name: 'Tanigawa, Koji', search_key: '谷川浩司', category: 1, kishi_id: 131, rank: 9, url: 'tanigawa'},
{name: 'Sato, Yasumitsu', search_key: '佐藤康光', category: 1, kishi_id: 182, rank: 9, url: 'satou-y'},
{name: 'Moriuchi, Toshiyuki', search_key: '森内俊之', category: 1, kishi_id: 183, rank: 9, url: 'moriuti'},
{name: 'Kato, Hifumi', search_key: '加藤一二三'},
{name: 'Naito, Kunio', search_key: '内藤國雄'},
{name: 'Kiriyama, Kiyosumi', search_key: '桐山清澄'},
{name: 'Mori, Keiji', search_key: '森けい二'},
{name: 'Minami, Yoshikazu', search_key: '南芳一'},
{name: 'Takahashi, Michio', search_key: '高橋道雄'},
{name: 'Aono, Teruichi', search_key: '青野照市'},
{name: 'Tanaka, Torahiko', search_key: '田中寅彦'},
{name: 'Awaji, Hitoshige', search_key: '淡路仁茂'},
{name: 'Tanaka, Kaishu', search_key: '田中魁秀'},
{name: 'Fujii, Takeshi', search_key: '藤井猛'},
{name: 'Tsukada, Yasuaki', search_key: '塚田泰明'},
{name: 'Maruyama, Tadahisa', search_key: '丸山忠久'},
{name: 'Kobayashi, Kenji', search_key: '小林健二'},
{name: 'Goda, Masataka', search_key: '郷田真隆'},
{name: 'Morishita, Taku', search_key: '森下卓'},
{name: 'Yashiki, Nobuyuki', search_key: '屋敷伸之'},
{name: 'Fukuzaki, Bungo', search_key: '福崎文吾'},
{name: 'Nakamura, Osamu', search_key: '中村修'},
{name: 'Shima, Akira', search_key: '島朗'},
{name: 'Fukaura, Koichi', search_key: '深浦康市'},
{name: 'Kubo, Toshiaki', search_key: '久保利明'},
{name: 'Inoue, Keita', search_key: '井上慶太'},
{name: 'Tamaru, Noboru', search_key: '田丸昇'},
{name: 'Miura, Hiroyuki', search_key: '三浦弘行'},
{name: 'Senzaki, Manabu', search_key: '先崎学'},
{name: 'Waki, Kenji', search_key: '脇謙二'},
{name: 'Tomioka, Eisaku', search_key: '富岡英作'},
{name: 'Suzuki, Daisuke', search_key: '鈴木大介'},
{name: 'Abe, Takashi', search_key: '阿部隆'},
{name: 'Nakata, Hiroki', search_key: '中田宏樹'},
{name: 'Namekata, Hisashi', search_key: '行方尚史'},
{name: 'Kimura, Kazuki', search_key: '木村一基'},
{name: 'Nakagawa, Daisuke', search_key: '中川大輔'},
{name: 'Hiura, Ichiro', search_key: '日浦市郎'},
{name: 'Hashimoto, Takanori', search_key: '橋本崇載'},
{name: 'Urano, Masahiko', search_key: '浦野真彦'},
{name: 'Kitahama, Kensuke', search_key: '北浜健介'},
{name: 'Izumi, Masaki', search_key: '泉正樹'},
{name: 'Yamasaki, Takayuki', search_key: '山崎隆之'},
{name: 'Akutsu, Chikara', search_key: '阿久津主税'},
{name: 'Hirose, Akihito', search_key: '広瀬章人'},
{name: 'Kamiya, Hiroshi', search_key: '神谷広志'},
{name: 'Tosa, Koji', search_key: '土佐浩司'},
{name: 'Sato, Amahiko', search_key: '佐藤天彦'},
{name: 'Azuma, Kazuo', search_key: '東和男'},
{name: 'Miyata, Toshio', search_key: '宮田利男'},
{name: 'Nishikawa, Keiji', search_key: '西川慶二'},
{name: 'Oshima, Eiji', search_key: '大島映二'},
{name: 'Arimori, Kouzou', search_key: '有森浩三'},
{name: 'Kanzaki, Kenji', search_key: '神崎健二'},
{name: 'Murooka, Katsuhiko', search_key: '室岡克彦'},
{name: 'Horiguchi, Koji', search_key: '堀口弘治'},
{name: 'Hatakeyama, Naruyuki', search_key: '畠山成幸'},
{name: 'Horiguchi, Kazushiza', search_key: '堀口一史座'},
{name: 'Sanada, Keiichi', search_key: '真田圭一'},
{name: 'Nozuki, Hirotaka', search_key: '野月浩貴'},
{name: 'Shoshi, Kazuharu', search_key: '所司和晴'},
{name: 'Nakata, Isao', search_key: '中田功'},
{name: 'Naganuma, Hiroshi', search_key: '長沼洋'},
{name: 'Ogura, Hisashi', search_key: '小倉久史'},
{name: 'Hatakeyama, Mamoru', search_key: '畠山鎮'},
{name: 'Sugimoto, Masataka', search_key: '杉本昌隆'},
{name: 'Mori, Nobuo', search_key: '森信雄'},
{name: 'Chuza, Makoto', search_key: '中座真'},
{name: 'Matsuo, Ayumu', search_key: '松尾歩'},
{name: 'Ishikawa, Akio', search_key: '石川陽生'},
{name: 'Sato, Shuji', search_key: '佐藤秀司'},
{name: 'Toyokawa, Takahiro', search_key: '豊川孝弘'},
{name: 'Iizuka, Hiroki', search_key: '飯塚祐紀'},
{name: 'Kobayashi, Hiroshi (167)', search_key: '小林宏'},
{name: 'Iijima, Eiji', search_key: '飯島栄治'},
{name: 'Kobayashi, Hiroshi (223)', search_key: '小林裕士'},
{name: 'Hirafuji, Shingo', search_key: '平藤真吾'},
{name: 'Toyoshima, Masayuki', search_key: '豊島将之'},
{name: 'Tamura, Kosuke', search_key: '田村康介'},
{name: 'Fujiwara, Naoya', search_key: '藤原直哉'},
{name: 'Inaba, Akira', search_key: '稲葉陽'},
{name: 'Murayama, Yasuaki', search_key: '村山慈明'},
{name: 'Kitajima, Tadao', search_key: '北島忠雄'},
{name: 'Anzai, Shoichi', search_key: '安西勝一'},
{name: 'Kinoshita, Koichi', search_key: '木下浩一'},
{name: 'Ito, Hirofumi', search_key: '伊藤博文'},
{name: 'Takada, Shohei', search_key: '高田尚平'},
{name: 'Okazaki, Hiroshi', search_key: '岡崎洋'},
{name: 'Kawakami, Takeshi', search_key: '川上猛'},
{name: 'Yagura, Norihiro', search_key: '矢倉規広'},
{name: 'Kubota, Yoshiyuki', search_key: '窪田義行'},
{name: 'Katsumata, Kiyokazu', search_key: '勝又清和'},
{name: 'Kondo, Masakazu', search_key: '近藤正和'},
{name: 'Sato, Shinnya', search_key: '佐藤紳哉'},
{name: 'Ina, Yusuke', search_key: '伊奈祐介'},
{name: 'Matsumoto, Yoshiyuki', search_key: '松本佳介'},
{name: 'Murata, Tomohiro', search_key: '村田智弘'},
{name: 'Annyouji, Takanori', search_key: '安用寺孝功'},
{name: 'Katagami, Daisuke', search_key: '片上大輔'},
{name: 'Masuda, Yuji', search_key: '増田裕司'},
{name: 'Muranaka, Shuji', search_key: '村中秀史'},
{name: 'Tobe, Makoto', search_key: '戸辺誠'},
{name: 'Miyata, Atsushi', search_key: '宮田敦史'},
{name: 'Chiba, Sakio', search_key: '千葉幸生'},
{name: 'Takano, Hideyuki', search_key: '高野秀行'},
{name: 'Nishio, Akira', search_key: '西尾明'},
{name: 'Sasaki, Makoto', search_key: '佐々木慎'},
{name: 'Ito, No', search_key: '伊藤能'},
{name: 'Nakamura, Taichi', search_key: '中村太地'},
{name: 'Takasaki, Issei', search_key: '高崎一生'},
{name: 'Yokoyama, Hiroaki', search_key: '横山泰明'},
{name: 'Oishi, Tadashi', search_key: '大石直嗣'},
{name: 'Nagase, Takuya', search_key: '永瀬拓矢'},
{name: 'Sato, Kazutoshi', search_key: '佐藤和俊'},
{name: 'Oikawa, Takuma', search_key: '及川拓馬'},
{name: 'Sawada, Shingo', search_key: '澤田真吾'},
{name: 'Yamamoto, Shinnya', search_key: '山本真也'},
{name: 'Ohira, Takehiro', search_key: '大平武洋'},
{name: 'Kanezawa, Takashi', search_key: '金沢孝史'},
{name: 'Ueno, Hirokazu', search_key: '上野裕和'},
{name: 'Nakao, Toshiyuki', search_key: '中尾敏之'},
{name: 'Nakamura, Ryosuke', search_key: '中村亮介'},
{name: 'Sakaguchi, Satoru', search_key: '阪口悟'},
{name: 'Kanai, Kota', search_key: '金井恒太'},
{name: 'Nagaoka, Yuya', search_key: '長岡裕也'},
{name: 'Toyama, Yusuke', search_key: '遠山雄亮'},
{name: 'Kumasaka, Manabu', search_key: '熊坂学'},
{name: 'Shimamoto, Ryo', search_key: '島本亮'},
{name: 'Sugai, Tatsuya', search_key: '菅井竜也'},
{name: 'Abe, Kenjiro', search_key: '阿部健治郎'},
{name: 'Murata, Akihiro', search_key: '村田顕弘'},
{name: 'Funae, Kohei', search_key: '船江恒平'},
{name: 'Fujikura, Yuki', search_key: '藤倉勇樹'},
{name: 'Segawa, Shoji', search_key: '瀬川晶司'},
{name: 'Yoshida, Masakazu', search_key: '吉田正和'},
{name: 'Saito, Shintaro', search_key: '斎藤慎太郎'},
{name: 'Ito, Shingo', search_key: '伊藤真吾'},
{name: 'Sasaki, Yuki', search_key: '佐々木勇気'},
{name: 'Takami, Taichi', search_key: '高見泰地'},
{name: 'Nishikawa, Kazuhiro', search_key: '西川和宏'},
{name: 'Tanaka, Yuichi', search_key: '田中悠一'},
{name: 'Abe, Koru', search_key: '阿部光瑠'},
{name: 'Sato, Shinnichi', search_key: '佐藤慎一'},
{name: 'Chida, Shota', search_key: '千田翔太'},
{name: 'Makino, Mitsunori', search_key: '牧野光則'},
{name: 'Kadokura, Keita', search_key: '門倉啓太'},
{name: 'Fujimori, Tetsuya', search_key: '藤森哲也'},
{name: 'Yashiro, Wataru', search_key: '八代弥'},
{name: 'Kamimura, Wataru', search_key: '上村亘'},
{name: 'Ishida, Naohiro', search_key: '石田直裕'},
{name: 'Watanabe, Hiromu', search_key: '渡辺大夢'},
{name: 'Takeuchi, Yugo', search_key: '竹内雄悟'},
{name: 'Ishii, Kentaro', search_key: '石井健太郎'},
{name: 'Sanmaido, Tatsuya', search_key: '三枚堂達也'},
{name: 'Hoshino, Yoshitaka', search_key: '星野良生'},
{name: 'Miyamoto, Hiroshi', search_key: '宮本広志'},
{name: 'Masuda, Yasuhiro', search_key: '増田康宏'},
{name: 'Kurosawa, Leo', search_key: '黒沢怜生'},
{search_key: '千葉涼子', name: 'Chiba, Ryoko'},
{search_key: '里見香奈', name: 'Satomi, Kana'},
{search_key: '清水市代', name: 'Shimizu, Ichiyo'},
{search_key: '鈴木環那', name: 'Suzuki, Kanna'},
{search_key: '室谷由紀', name: 'Muroya, Yuki'},
{search_key: '中井広恵', name: 'Nakai, Hiroe'},
{search_key: '矢内理絵子', name: 'Yauchi, Rieko'},
{search_key: '貞升南', name: 'Sadamasu, Minami'},
{search_key: '中倉宏美', name: 'Nakakura, Hiromi'},
{search_key: '本田小百合', name: 'Honda, Sayuri'},
{search_key: '室田伊緒', name: 'Murota, Io'},
{search_key: '岩根忍', name: 'Iwane, Shinobu'},
{search_key: '上田初美', name: 'Ueda, Hatsumi'},
{search_key: '和田あき', name: 'Wada, Aki'},
{search_key: '真田彩子', name: 'Sanada, Ayako'},
{search_key: '村田智穂', name: 'Murata, Chiho'},
{search_key: '相川春香', name: 'Aikawa, Haruka'},
{search_key: '蛸島彰子', name: 'Takojima, Akiko'},
{search_key: '野田澤彩乃', name: 'Nodasawa, Ayano'},
{search_key: '藤田綾', name: 'Fujita, Aya'},
{search_key: '北尾まどか', name: 'Kitao, Madoka'},
{search_key: '安食総子', name: 'Ajiki, Fusako'},
{search_key: '山田朱未', name: 'Yamada, Akemi'},
{search_key: '植村真理', name: 'Uemura, Mari'},
{search_key: '石高澄恵', name: 'Ishitaka, Sumie'},
{search_key: '大庭美樹', name: 'Oba, Miki'},
{search_key: '井道千尋', name: 'Ido, Chihiro'},
{search_key: '渡辺弥生', name: 'Watanabe, Mio'},
{search_key: '山口恵梨子', name: 'Yamaguchi, Eriko'},
{search_key: '香川愛生', name: 'Kagawa, Manao'},
{search_key: '中村真梨花', name: 'Nakamura, Marika'},
{search_key: '中村桃子', name: 'Nakamura, Momoko'},
{search_key: '伊奈川愛菓', name: 'Inagawa, Manaka'},
{search_key: '熊倉紫野', name: 'Kumakura, Shino'},
{search_key: '中倉彰子', name: 'Nakakura, Akiko'},
{search_key: '長沢千和子', name: 'Nagasawa, Chikako'},
{search_key: '上川香織', name: 'Uekawa, Kaori'},
{search_key: '久津知子', name: 'Hisatsu, Tomoko'},
{search_key: '竹部さゆり', name: 'Takebe, Sayuri'},
{search_key: '島井咲緒里', name: 'Shimai, Saori'},
{search_key: '甲斐智美', name: 'Kai, Tomomi'},
{search_key: '早水千紗', name: 'Hayamizu, Chisa'},
{search_key: '石橋幸緒', name: 'Ishibashi, Sachio'},
{search_key: '長谷川優貴', name: 'Hasegawa, Yuki'},
{search_key: '高群佐知子', name: 'Takamure, Sachiko'},
{search_key: '山田久美', name: 'Yamada, Kumi'},
{search_key: '斎田晴子', name: 'Saida, Haruko'},
{search_key: '渡部愛', name: 'Watanabe, Mana'},
{search_key: '竹俣紅', name: 'Takemata, Beni'},
{search_key: '北村桂香', name: 'Kitamura, Keika'},
{search_key: '飯野愛', name: 'Iino, Ai'},
{search_key: '塚田恵梨花', name: 'Tsukada, Erika'},
{search_key: '加藤桃子', name: 'Kato, Momoko'},
{search_key: '鹿野圭生', name: 'Kano, Tamao'},
{search_key: '船戸陽子', name: 'Funato, Yoko'},
{search_key: '山根ことみ', name: 'Yamane, Kotomi'},
{search_key: '伊藤沙恵', name: 'Ito, Sae'},
{search_key: '高浜愛子', name: 'Takahama, Aiko'},
{search_key: '山口絵美菜', name: 'Yamaguchi, Emina'},
{search_key: '佐藤義則', name: 'Sato, Yoshinori', rank: 8},
{search_key: '滝誠一郎', name: 'Taki, Seiichiro', rank: 8},
{search_key: '野田敬三', name: 'Noda, Keizo', rank: 6},
{search_key: '武者野勝巳', name: 'Mushano, Katsumi', rank: 7},
{search_key: '前田祐司', name: 'Maeda, Yuji', rank: 8},
{search_key: '武市三郎', name: 'Takeichi, Saburo', rank: 7},
{search_key: '植山悦行', name: 'Ueyama, Yoshiyuki', rank: 7},
{search_key: '大野八一雄', name: 'Ono, Yaichio', rank: 9},
{search_key: '二上達也', name: 'Futakami, Tatsuya', rank: 9},
{search_key: '若松政和', name: 'Wakamatsu, Masakazu', rank: 7},
{search_key: '勝浦修', name: 'Katsuura, Osamu', rank: 9},
{search_key: '剱持松二', name: 'Kenmochi, Shoji', rank: 9},
{search_key: '西村一義', name: 'Nishimura, Kazuyoshi', rank: 9},
{search_key: '大内延介', name: 'Ouchi, Nobuyuki', rank: 9},
{search_key: '佐伯昌優', name: 'Saeki, Yoshimasa', rank: 9},
{search_key: '桜井昇', name: 'Sakurai, Noboru', rank: 8},
{search_key: '安恵照剛', name: 'Yasue, Terutaka', rank: 8},
{search_key: '関根茂', name: 'Sekine, Shigeru', rank: 9},
{search_key: '賀集正三', name: 'Kashu, Shozo', rank: 7},
{search_key: '有吉道夫', name: 'Ariyoshi, Michio', rank: 9},
{search_key: '森安正幸', name: 'Moriyasu, Masayuki', rank: 7},
{search_key: '伊藤果', name: 'Ito, Hatasu', rank: 7},
{search_key: '関屋喜代作', name: 'Sekiya, Kiyosaku', rank: 8},
{search_key: '石田和雄', name: 'Ishida, Kazuo', rank: 9},
{search_key: '加瀬純一', name: 'Kase, Junnichi', rank: 6},
{search_key: '桐谷広人', name: 'Kiritani, Hiroto', rank: 7},
{search_key: '中田章道', name: 'Nakada, Shodo', rank: 7},
{search_key: '神吉宏充', name: 'Kanki, Hiromitsu', rank: 7},
{search_key: '中原誠', name: 'Nakahara, Makoto', rank: 9},
{search_key: '木村義徳', name: 'Kimura, Yoshinori', rank: 9},
{search_key: '飯野健二', name: 'Iino, Kenji', rank: 7},
{search_key: '北村昌男', name: 'Kitamura, Masao', rank: 9},
{search_key: '宮坂幸雄', name: 'Miyasaka, Yukio', rank: 9},
{search_key: '長谷部久雄', name: 'Hasebe, Hisao', rank: 9},
{search_key: '大村和久', name: 'Omura, Kazuhisa', rank: 8},
{search_key: '吉田利勝', name: 'Yoshida, Toshikatsu', rank: 8},
{search_key: '山口英夫', name: 'Yamaguchi, Hideo', rank: 8},
{search_key: '野本虎次', name: 'Nomoto, Toratsugu', rank: 8},
{search_key: '鈴木輝彦', name: 'Suzuki, Teruhiko', rank: 8},
{search_key: '坪内利幸', name: 'Tsubouchi, Toshiyuki', rank: 8},
{search_key: '児玉孝一', name: 'Kodama, Koichi', rank: 7},
{search_key: '田辺一郎', name: 'Tanabe, Ichiro', rank: 7},
{search_key: '菊地常夫', name: 'Kikuchi, Tsuneo', rank: 7},
{search_key: '小阪昇', name: 'Kosaka, Noboru', rank: 7},
{search_key: '木村嘉孝', name: 'Kimura, Yoshitaka', rank: 7},
{search_key: '松浦隆一', name: 'Matsuura, Ryuichi', rank: 7},
{search_key: '酒井順吉', name: 'Sakai, Junkichi', rank: 7},
{search_key: '沼春雄', name: 'Numa, Haruo', rank: 7},
{search_key: '有野芳人', name: 'Arino, Yoshito', rank: 7},
{search_key: '青木清', name: 'Aoki, Kiyoshi', rank: 7},
{search_key: '瀬戸博晴', name: 'Seto, Hiroharu', rank: 7},
{search_key: '依田有司', name: 'Yoda, Yuji', rank: 7},
{search_key: '飯田弘之', name: 'Iida, Hiroyuki', rank: 6},
{search_key: '櫛田陽一', name: 'Kushida, Yoichi', rank: 6},
{search_key: '関浩', name: 'Seki, Hiroshi', rank: 6},
{search_key: '本間博', name: 'Honma, Hiroshi', rank: 6},
{search_key: '関根紀代子', name: 'Sekine, Kiyoko', rank: 6},
{search_key: '谷川治恵', name: 'Tanikawa, Harue', rank: 5},
{search_key: '宇治正子', name: 'Uji, Masako', rank: 3},
{search_key: '高橋和', name: 'Takahashi, Yamato', rank: 3},
{search_key: '伊藤明日香', name: 'Ito, Asuka', rank: 1},
{search_key: '坂東香菜子', name: 'Bando, Kanako', rank: 1},
{search_key: '森安多恵子', name: 'Moriyasu, Taeko', rank: 4},
{search_key: '土居市太郎', name: 'Doi, Ichitaro', rank: 9, birthday: '1887/11/20', teacher_name: '（故）関根金次郎十三世名人'},
{search_key: '金易二郎', name: 'Kon, Yasujiro', rank: 9, birthday: '1890/10/10', teacher_name: '（故）関根金次郎十三世名人'},
{search_key: '山本樟郎', name: 'Yamamoto, Kusuo', rank: 8, birthday: '1890/9/6', teacher_name: '（故）小菅剣之助名誉名人'},
{search_key: '平野信助', name: 'Hirano, Shinsuke', rank: 7, birthday: '1891/5/19', teacher_name: '（故）大崎熊雄九段'},
{search_key: '中井捨吉', name: 'Nakai, Sutekichi', rank: 8, birthday: '1892/8/28', teacher_name: '（故）木見金治郎九段'},
{search_key: '上田三三', name: 'Ueda, Sanzo', rank: 7, birthday: '1893/1/25', teacher_name: '（故）木見金治郎九段'},
{search_key: '藤内金吾', name: 'Fujiuchi, Kingo', rank: 8, birthday: '1893/3/20', teacher_name: '（故）阪田三吉'},
{search_key: '飯塚勘一郎', name: 'Iizuka, Kannichiro', rank: 8, birthday: '1895/1/7', teacher_name: '（故）大崎熊雄九段'},
{search_key: '村上真一', name: 'Murakami, Shinnichi', rank: 8, birthday: '1897/6/16', teacher_name: '(故）木見金治郎九段'},
{search_key: '志沢春吉', name: 'Shizawa, Harukichi', rank: 8, birthday: '1899/1/3', teacher_name: '（故）大崎熊雄九段'},
{search_key: '野村慶虎', name: 'Nomura, Yoshitora', rank: 7, birthday: '1899/12/12', teacher_name: '（故）神田辰之助九段'},
{search_key: '小泉雅信', name: 'Koizumi, Masanobu', rank: 8, birthday: '1900/6/8', teacher_name: '（故）関根金次郎十三世名人'},
{search_key: '畝美与吉', name: 'Une, Miyokichi', rank: 7, birthday: '1900/11/15', teacher_name: '（故）神田辰之助九段'},
{search_key: '金子金五郎', name: 'Kaneko, Kingoro', rank: 9, birthday: '1902/1/6', teacher_name: '（故）土居市太郎名誉名人'},
{search_key: '市川一郎', name: 'Ichikawa, Ichiro', rank: 8, birthday: '1903/2/18', teacher_name: '（故）大崎熊雄九段'},
{search_key: '永沢勝雄', name: 'Nagasawa, Katsuo', rank: 8, birthday: '1904/4/13', teacher_name: '（故）飯塚勘一郎八段'},
{search_key: '萩原淳', name: 'Hagiwara, Kiyoshi', rank: 9, birthday: '1904/10/11', teacher_name: '（故）土居市太郎名誉名人'},
{search_key: '木村義雄', name: 'Kimura, Yoshio', rank: 9, birthday: '1905/2/21', teacher_name: '（故）関根金次郎十三世名人'},
{search_key: '奥野基芳', name: 'Okuno, Motoyoshi', rank: 8, birthday: '1905/11/27', teacher_name: '（故）小泉雅信八段'},
{search_key: '渡辺東一', name: 'Watanabe, Toichi', rank: 9, birthday: '1905/12/25', teacher_name: '（故）関根金次郎十三世名人'},
{search_key: '岡崎史明', name: 'Okazaki, Shimei', rank: 8, birthday: '1907/6/15', teacher_name: '（故）神田辰之助九段'},
{search_key: '北村秀治郎', name: 'Kitamura, Hidejiro', rank: 8, birthday: '1907/12/15', teacher_name: '（故）神田辰之助九段'},
{search_key: '藤川義夫', name: 'Fujikawa, Yoshio', rank: 7, birthday: '1908/10/2', teacher_name: '（故）大崎熊雄九段'},
{search_key: '加藤恵三', name: 'Kato, Keizo', rank: 8, birthday: '1908/12/5', teacher_name: '（故）石井秀吉七段'},
{search_key: '坂口允彦', name: 'Sakaguchi, Nobuhiko', rank: 9, birthday: '1908/12/10', teacher_name: '（故）花田長太郎九段'},
{search_key: '橋爪敏太郎', name: 'Hashizume, Toshitaro', rank: 7, birthday: '1909/3/17', teacher_name: '（故）宮松関三郎八段'},
{search_key: '建部和歌夫', name: 'Takebe, Wakao', rank: 8, birthday: '1909/7/25', teacher_name: '（故）土居市太郎名誉名人'},
{search_key: '角田三男', name: 'Kakuta, Mitsuo', rank: 8, birthday: '1910/2/2', teacher_name: '（故）木見金治郎九段'},
{search_key: '吉田六彦', name: 'Yoshida, Mutsuhiko', rank: 7, birthday: '1910/3/1', teacher_name: '（故）土居市太郎名誉名人'},
{search_key: '加藤治郎', name: 'Kato, Jiro', rank: 9, birthday: '1910/6/1', teacher_name: '（故）山本樟郎八段'},
{search_key: '大野源一', name: 'Ono, Gennichi', rank: 9, birthday: '1911/9/1', teacher_name: '（故）木見金治郎九段'},
{search_key: '小堀清一', name: 'Kobori, Seiichi', rank: 9, birthday: '1912/2/10', teacher_name: '（故）金子金五郎九段'},
{search_key: '梶一郎', name: 'Kaji, Ichiro', rank: 9, birthday: '1912/6/6', teacher_name: '（故）土居市太郎名誉名人'},
{search_key: '北楯修哉', name: 'Kitadate, Shuya', rank: 9, birthday: '1912/11/15', teacher_name: '（故）木村義雄十四世名人'},
{search_key: '松下力', name: 'Matsushita, Tsutomu', rank: 9, birthday: '1913/3/7', teacher_name: '（故）土居市太郎名誉名人'},
{search_key: '板谷四郎', name: 'Itaya, Shiro', rank: 9, birthday: '1913/6/10', teacher_name: '（故）木村義雄十四世名人'},
{search_key: '大和久彪', name: 'Owaku, Takeshi', rank: 8, birthday: '1914/1/23', teacher_name: '（故）石井秀吉七段'},
{search_key: '京須行男', name: 'Kyosu, Yukio', rank: 8, birthday: '1914/1/23', teacher_name: '（故）宮松関三郎八段'},
{search_key: '佐藤豊', name: 'Sato, Yutaka', rank: 6, birthday: '1914/7/5', teacher_name: '（故）宮松関三郎八段'},
{search_key: '塚田正夫', name: 'Tsukada, Masao', rank: 9, birthday: '1914/8/2', teacher_name: '（故）花田長太郎九段'},
{search_key: '山中和正', name: 'Yamanaka, Kazumasa', rank: 8, birthday: '1914/12/15', teacher_name: '（故）木見金治郎九段'},
{search_key: '松浦卓造', name: 'Matsuura, Takuzo', rank: 8, birthday: '1915/1/22', teacher_name: '（故）神田辰之助九段'},
{search_key: '荒巻三之', name: 'Aramaki, Mitsuyuki', rank: 9, birthday: '1915/3/28', teacher_name: '（故）花田長太郎九段'},
{search_key: '増田敏二', name: 'Masuda, Toshiji', rank: 6, birthday: '1915/8/14', teacher_name: '（故）岡崎史明八段'},
{search_key: '平野広吉', name: 'Hirano, Hirokichi', rank: 7, birthday: '1915/9/5', teacher_name: '（故）斎藤銀次郎八段'},
{search_key: '高島一岐代', name: 'Takashima, Kazukiyo', rank: 9, birthday: '1916/5/18', teacher_name: '（故）藤内金吾八段'},
{search_key: '松田辰雄', name: 'Matsuda, Tatsuo', rank: 8, birthday: '1916/1/1', teacher_name: '(故）神田辰之助九段'},
{search_key: '山本武雄', name: 'Yamamoto, Takeo', rank: 9, birthday: '1917/1/5', teacher_name: '（故）金易二郎名誉九段'},
{search_key: '星田啓三', name: 'Hoshida, Keizo', rank: 8, birthday: '1917/1/8', teacher_name: '（故）阪田三吉'},
{search_key: '花村元司', name: 'Hanamura, Motoji', rank: 9, birthday: '1917/11/18', teacher_name: '（故）木村義雄十四世名人'},
{search_key: '升田幸三', name: 'Masuda, Kozo', rank: 9, birthday: '1918/3/21', teacher_name: '（故）木見金治郎九段'},
{search_key: '南口繁一', name: 'Minamiguchi, Shigekazu', rank: 9, birthday: '1918/9/4', teacher_name: '（故）村上真一八段'},
{search_key: '金高清吉', name: 'Kanetaka, Seikichi', rank: 8, birthday: '1919/3/9', teacher_name: '（故）木村義雄十四世名人'},
{search_key: '佐瀬勇次', name: 'Sase, Yuji', rank: 9, birthday: '1919/3/17', teacher_name: '（故）石井秀吉七段'},
{search_key: '丸田祐三', name: 'Maruta, Yuzo', rank: 9, birthday: '1919/3/30', teacher_name: '（故）平野信助七段', category: 1, url: 'maruta'},
{search_key: '本間爽悦', name: 'Honma, Soetsu', rank: 8, birthday: '1919/12/23', teacher_name: '（故）中井捨吉八段'},
{search_key: '木川貴一', name: 'Kigawa, Kiichi', rank: 6, birthday: '1920/1/14', teacher_name: '（故）加藤治郎名誉九段'},
{search_key: '山川次彦', name: 'Yamakawa, Tsugihiko', rank: 8, birthday: '1920/1/18', teacher_name: '（故）金子金五郎九段'},
{search_key: '高柳敏夫', name: 'Takayanagi, Toshio', rank: 9, birthday: '1920/2/20', teacher_name: '（故）金易二郎名誉九段'},
{search_key: '富沢幹雄', name: 'Tomizawa, Mikio', rank: 8, birthday: '1920/4/20', teacher_name: '（故）山本樟郎八段'},
{search_key: '北村文男', name: 'Kitamura, Fumio', rank: 7, birthday: '1920/10/4', teacher_name: '（故）板谷四郎九段'},
{search_key: '松田茂役', name: 'Matsuda, Shigeyuki', rank: 9, birthday: '1921/6/28', teacher_name: '（故）金子金五郎九段'},
{search_key: '清野静男', name: 'Seino, Shizuo', rank: 8, birthday: '1922/8/14', teacher_name: '（故）木村義雄十四世名人'},
{search_key: '廣津久雄', name: 'Hirotsu, Hisao', rank: 9, birthday: '1923/2/26', teacher_name: '（故）花田長太郎九段'},
{search_key: '原田泰夫', name: 'Harada, Yasuo', rank: 9, birthday: '1923/3/1', teacher_name: '（故）加藤治郎名誉九段'},
{search_key: '大山康晴', name: 'Oyama, Yasuharu', rank: 9, birthday: '1923/3/13', teacher_name: '（故）木見金治郎九段'},
{search_key: '津村常吉', name: 'Tsumura, Tsuneyoshi', rank: 7, birthday: '1923/7/28', teacher_name: '（故）小堀清一九段'},
{search_key: '西本馨', name: 'Nishimoto, Kaoru', rank: 7, birthday: '1923/8/10', teacher_name: '（故）木見金治郎九段', category: 1, url: 'nisimoto'},
{search_key: '加藤博二', name: 'Kato, Hiroji', rank: 9, birthday: '1923/9/15', teacher_name: '（故）土居市太郎名誉名人', category: 1, url: 'katou-hiro'},
{search_key: '五十嵐豊一', name: 'Igarashi, Toyoichi', rank: 9, birthday: '1924/9/27', teacher_name: '（故）関根金次郎十三世名人'},
{search_key: '下平幸男', name: 'Shimodaira, Yukio', rank: 8, birthday: '1924/11/16', teacher_name: '（故）渡辺東一名誉九段'},
{search_key: '浅沼一', name: 'Asanuma, Hajime', rank: 7, birthday: '1924/12/18', teacher_name: '（故）小泉雅信八段', category: 1, url: 'asanuma'},
{search_key: '橋本三治', name: 'Hashimoto, Sanji', rank: 8, birthday: '1925/12/12', teacher_name: '（故）木見金治郎九段'},
{search_key: '灘蓮照', name: 'Nada, Rensho', rank: 9, birthday: '1927/3/16', teacher_name: '（故）神田辰之助九段'},
{search_key: '佐藤健伍', name: 'Sato, Kengo', rank: 6, birthday: '1928/3/16', teacher_name: '（故）加藤治郎名誉九段'},
{search_key: '大原英二', name: 'Ohara, Eiji', rank: 7, birthday: '1929/1/10', teacher_name: '（故）野村慶虎七段'},
{search_key: '神田鎮雄', name: 'Kanda, Shizuo', rank: 7, birthday: '1930/3/13', teacher_name: '（故）灘蓮照九段'},
{search_key: '熊谷達人', name: 'Kumagai, Michihito', rank: 8, birthday: '1930/12/7', teacher_name: '（故）野村慶虎七段'},
{search_key: '大友昇', name: 'Otomo, Noboru', rank: 9, birthday: '1931/8/6', teacher_name: '（故）飯塚勘一郎八段'},
{search_key: '伊藤禎英', name: 'Ito, Yoshihide', rank: 6, birthday: '1931/12/12', teacher_name: '（故）建部和歌夫八段'},
{search_key: '二見敬三', name: 'Futami, Keizo', rank: 7, birthday: '1932/2/20', teacher_name: '（故）木見金治郎九段'},
{search_key: '寺田昭夫', name: 'Terada, Akio', rank: 6, birthday: '1932/8/15', teacher_name: '（故）市川一郎八段'},
{search_key: '佐藤庄平', name: 'Sato, Shohei', rank: 8, birthday: '1933/1/14', teacher_name: '（故）原田泰夫九段'},
{search_key: '山田道美', name: 'Yamada, Michiyoshi', rank: 8, birthday: '1933/12/11', teacher_name: '（故）金子金五郎九段'},
{search_key: '相馬清司', name: 'Soma, Seiji', rank: 7, birthday: '1935/3/12', teacher_name: '(故）清野静男八段'},
{search_key: '伊達康夫', name: 'Date, Yasuo', rank: 8, birthday: '1936/7/22', teacher_name: '（故）岡崎史明八段'},
{search_key: '佐藤大五郎', name: 'Sato, Daigoro', rank: 9, birthday: '1936/10/19', teacher_name: '（故）渡辺東一名誉九段'},
{search_key: '芹沢博文', name: 'Serizawa, Hirobumi', rank: 9, birthday: '1936/10/23', teacher_name: '（故）高柳敏夫名誉九段'},
{search_key: '河口俊彦', name: 'Kawaguchi, Toshihiko', rank: 7, birthday: '1936/11/23', teacher_name: '（故）小堀清一九段', category: 1, url: 'kawaguti'},
{search_key: '高田丈資', name: 'Takada, Takeshi', rank: 7, birthday: '1937/4/12', teacher_name: '（故）荒巻三之九段'},
{search_key: '山口千嶺', name: 'Yamaguchi, Chimine', rank: 8, birthday: '1937/6/11', teacher_name: '（故）飯塚勘一郎八段'},
{search_key: '木下晃', name: 'Kinoshita, Akira', rank: 7, birthday: '1939/8/15', teacher_name: '（故）村上真一八段'},
{search_key: '板谷進', name: 'Itaya, Susumu', rank: 9, birthday: '1940/12/10', teacher_name: '（故）板谷四郎九段'},
{search_key: '高島弘光', name: 'Takashima, Hiromitsu', rank: 8, birthday: '1941/9/15', teacher_name: '（故）高島一岐代九段'},
{search_key: '米長邦雄', name: 'Yonenaga, Kunio', rank: 9, birthday: '1943/6/10', teacher_name: '（故）佐瀬勇次名誉九段', category: 1, url: 'yonenaga'},
{search_key: '池田修一', name: 'Ikeda, Shuichi', rank: 7, birthday: '1945/2/12', teacher_name: '（故）花村元司九段'},
{search_key: '中嶋克安', name: 'Nakajima, Katsuyasu', rank: 6, birthday: '1947/2/21', teacher_name: '二上達也九段'},
{search_key: '亀谷源吾', name: 'Kameya, Gengo', rank: 4, birthday: '1947/4/20', teacher_name: '二上達也九段'},
{search_key: '椎橋金司', name: 'Shiihashi, Kinji', rank: 6, birthday: '1948/10/10', teacher_name: '（故）松下　力九段', category: 1, url: 'siihasi'},
{search_key: '森安秀光', name: 'Moriyasu, Hidemitsu', rank: 9, birthday: '1949/8/18', teacher_name: '（故）藤内金吾八段'},
{search_key: '真部一男', name: 'Manabe, Kazuo', rank: 9, birthday: '1952/2/16', teacher_name: '（故）加藤治郎名誉九段'},
{search_key: '小野修一', name: 'Ono, Shuichi', rank: 8, birthday: '1958/2/12', teacher_name: '（故）建部和歌夫八段'},
{search_key: '小野敦生', name: 'Ono, Atsuo', rank: 6, birthday: '1962/5/12', teacher_name: '安恵照剛八段'},
{search_key: '達正光', name: 'Tachi, Masamitsu', rank: 7, birthday: '1965/4/18', teacher_name: '（故）高柳敏夫名誉九段'},
{search_key: '村山聖', name: 'Murayama, Satoshi', rank: 9, birthday: '1969/6/15', teacher_name: '森　信雄七段'},
{search_key: '杉崎里子', name: 'Sugisaki, Satoko', rank: 4, birthday: '1942/12/24'},
{search_key: '大崎熊雄', name: 'Osaki, Kumao', birthday: '1884/1/1', teacher_name: '井上義雄'},
{search_key: '木見金治郎', name: 'Kimi, Kinjiro', birthday: '1878/6/24', teacher_name: '関根金次郎'},
{search_key: '花田長太郎', name: 'Hanada, Chotaro', birthday: '1897/7/6', teacher_name: '関根金次郎'},
{search_key: '斎藤銀次郎', name: 'Saito, Ginjiro', birthday: '1904/10/7', teacher_name: '石井秀吉'},
{search_key: '宮松関三郎', name: 'Miyamatsu, Sekisaburo', birthday: '1886/1/14', teacher_name: '井上義雄'},
{search_key: '井上義雄', name: 'Inoue, Yoshio', birthday: '1865/1/1', teacher_name: '小林東伯斎'},
{search_key: '阪田三吉', name: 'Sakata, Sankichi', birthday: '1870/7/1', teacher_name: '小林東伯斎'},
{search_key: '小林東伯斎', name: 'Kobayashi, Tohakusai', birthday: '1811/1/1'},
{search_key: '神田辰之助', name: 'Kanda, Tatsunosuke', birthday: '1893/2/22'},
{search_key: '石井秀吉', name: 'Ishii, Hideyoshi', birthday: '1895/1/1'},
{search_key: '関根金次郎', name: 'Sekine, Kinjiro', birthday: '1868/4/23'},
{search_key: '小菅剣之助', name: 'Kosuga, Kennosuke', birthday: '1865/2/19'}
])

if Country.count == 0
  lines = <<EOM
Afghanistan,4,,
Åland Islands,248,,
Albania,8,,
Algeria,12,,
American Samoa,16,,
Andorra,20,,
Angola,24,,
Anguilla,660,,
Antarctica,10,,
Antigua and Barbuda,28,,6
Argentina,32,1,7
Armenia,51,,
Aruba,533,,
Australia,36,1,8
Austria,40,1,4
Azerbaijan,31,,
Bahamas,44,,6
Bahrain,48,,
Bangladesh,50,,
Barbados,52,,6
Belarus,112,1,4
Belgium,56,1,4
Belize,84,,6
Benin,204,,
Bermuda,60,,
Bhutan,64,,
Bolivia,68,,7
Bosnia and Herzegovina,70,,4
Botswana,72,,
Bouvet Island,74,,
Brazil,76,1,7
British Indian Ocean Territory,86,,
Brunei Darussalam,96,,
Bulgaria,100,,
Burkina Faso,854,,
Burundi,108,,
Cambodia,116,,
Cameroon,120,,
Canada,124,1,5
Cape Verde,132,,
Cayman Islands,136,,
Central African Republic,140,,
Chad,148,,
Chile,152,1,7
China,156,1,2
Christmas Island,162,,
Cocos (Keeling) Islands,166,,
Colombia,170,,7
Comoros,174,,
Congo Republic,178,,
Congo Democratic Republic,180,,
Cook Islands,184,,
Costa Rica,188,,6
Côte d'Ivoire,384,1,9
Croatia,191,,
Cuba,192,,6
Cyprus,196,,
Czech Republic,203,1,4
Denmark,208,1,4
Djibouti,262,,
Dominica,212,,6
Dominican Republic,214,,6
Ecuador,218,,7
Egypt,818,,
El Salvador,222,,6
Equatorial Guinea,226,,
Eritrea,232,,
Estonia,233,,
Ethiopia,231,,
Falkland Islands,238,,
Faroe Islands,234,,
Fiji,242,,
Finland,246,1,4
France,250,1,4
French Guiana,254,,
French Polynesia,258,,
French Southern Territories,260,,
Gabon,266,,
Gambia,270,,
Georgia,268,,
Germany,276,1,4
Ghana,288,,
Gibraltar,292,,
Greece,300,1,4
Greenland,304,,
Grenada,308,,6
Guadeloupe,312,,
Guam,316,,
Guatemala,320,,6
Guernsey,831,,
Guinea,324,,
Guinea-Bissau,624,,
Guyana,328,,7
Haiti,332,,6
Heard Island and McDonald Islands,334,,
Honduras,340,,6
Hong Kong,344,,2
Hungary,348,1,4
Iceland,352,,
India,356,,
Indonesia,360,,2
Iran,364,,
Iraq,368,,
Ireland,372,,
Isle of Man,833,,
Israel,376,,
Italy,380,1,4
Jamaica,388,,6
Japan,392,1,1
Jersey,832,,
Jordan,400,,
Kazakhstan,398,,
Kenya,404,,
Kiribati,296,,
North Korea,408,,
South Korea,410,,2
Kuwait,414,,
Kyrgyzstan,417,,
Laos,418,,
Latvia,428,,
Lebanon,422,,
Lesotho,426,,
Liberia,430,,
Libya,434,,
Liechtenstein,438,,
Lithuania,440,,4
Luxembourg,442,,4
Macao,446,,
Macedonia (Former Yugoslav Republic of),807,,
Madagascar,450,,
Malawi,454,,
Malaysia,458,1,2
Maldives,462,,
Mali,466,,
Malta,470,,
Marshall Islands,584,,
Martinique,474,,
Mauritania,478,,
Mauritius,480,,
Mayotte,175,,
Mexico,484,1,6
Micronesia (Federated States of),583,,
Moldova,498,,
Monaco,492,1,4
Mongolia,496,,2
Montenegro,499,,
Montserrat,500,,
Morocco,504,,
Mozambique,508,,
Myanmar,104,,
Namibia,516,,
Nauru,520,,
Nepal,524,,
Netherlands,528,1,4
Netherlands Antilles,530,,
New Caledonia,540,,
New Zealand,554,1,8
Nicaragua,558,,6
Niger,562,,
Nigeria,566,,
Niue,570,,
Norfolk Island,574,,
Northern Mariana Islands,580,,
Norway,578,1,4
Oman,512,,
Pakistan,586,,
Palau,585,,
Palestinian Territories,275,,
Panama,591,,6
Papua New Guinea,598,,
Paraguay,600,,7
Peru,604,,7
Philippines,608,,
Pitcairn,612,,
Poland,616,1,4
Portugal,620,1,4
Puerto Rico,630,,
Qatar,634,,
Réunion,638,,
Romania,642,,
Russia,643,1,4
Rwanda,646,,
Saint Barthélemy,652,,
Saint Helena/Ascension/Tristan da Cunha,654,,
Saint Kitts and Nevis,659,,6
Saint Lucia,662,,6
Saint Martin,663,,
Saint Pierre and Miquelon,666,,
Saint Vincent and the Grenadines,670,,6
Samoa,882,,
San Marino,674,,
Sao Tome and Principe,678,,
Saudi Arabia,682,,
Senegal,686,,
Serbia,688,,
Seychelles,690,,
Sierra Leone,694,,
Singapore,702,1,2
Slovakia,703,1,4
Slovenia,705,,
Solomon Islands,90,,
Somalia,706,,
South Africa,710,,
South Georgia and the South Sandwich Islands,239,,
Spain,724,1,4
Sri Lanka,144,,
Sudan,736,,
Suriname,740,,7
Svalbard and Jan Mayen,744,,
Swaziland,748,,
Sweden,752,1,4
Switzerland,756,1,4
Syria,760,,
Taiwan,158,1,2
Tajikistan,762,,
Tanzania,834,,
Thailand,764,1,2
Timor-Leste,626,,
Togo,768,,
Tokelau,772,,
Tonga,776,,
Trinidad and Tobago,780,,6
Tunisia,788,,
Turkey,792,,
Turkmenistan,795,,
Turks and Caicos Islands,796,,
Tuvalu,798,,
Uganda,800,,
Ukraine,804,1,4
United Arab Emirates,784,,
United Kingdom,826,1,4
United States,840,1,5
United States Minor Outlying Islands,581,,5
Uruguay,858,,7
Uzbekistan,860,,
Vanuatu,548,,
Vatican City State,336,,
Venezuela,862,,7
Vietnam,704,,
Virgin Islands (British),92,,
Virgin Islands (U.S.),850,,
Wallis and Futuna,876,,
Western Sahara,732,,
Yemen,887,,
Zambia,894,,
Zimbabwe,716,,
EOM

  lines.split("\n").each do |line|
    fields = line.split(",")
    Country.create(name: fields[0], code: fields[1], enabled: fields[2] == "1", region_id: fields[3] == "" ? nil : fields[3].to_i)
  end
end

if Language.count == 0
  lines = %w(
    English,826
    Japanese,392
    Chinese(simplified),156
    Chinese(traditional),158
    Spanish,724
    French,250
    German,276
  )
  lines.each do |line|
    fields = line.split(",")
    Language.create(name: fields[0], flag_code: fields[1], enabled: true)
  end
end

if Region.count == 0
  Region.create(name:"Japan")
  Region.create(name:"East Asia")
  Region.create(name:"West Asia")
  Region.create(name:"Europe")
  Region.create(name:"North America")
  Region.create(name:"Latin America")
  Region.create(name:"Africa")
end
