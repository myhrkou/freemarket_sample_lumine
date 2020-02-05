# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

lady = Category.create(:name=>"レディース")
men = Category.create(:name=>"メンズ")
child = Category.create(:name=>"子供")

lady_tops = lady.children.create(:name=>"トップス")
lady_jacket = lady.children.create(:name=>"ジャケット/アウター")
men_tops = men.children.create(:name=>"トップス")
men_jacket = men.children.create(:name=>"ジャケット/アウター")
child_tops = child.children.create(:name=>"トップス")
child_jacket = child.children.create(:name=>"ジャケット/アウター")

lady_tops.children.create([{:name=>"Tシャツ/カットソー(半袖/袖なし)"}, {:name=>"Tシャツ/カットソー(七分/長袖)"},{:name=>"その他"}])
lady_jacket.children.create([{:name=>"テーラードジャケット"}, {:name=>"ノーカラージャケット"}, {:name=>"Gジャン/デニムジャケット"},{:name=>"その他"}])
men_tops.children.create([{:name=>"Tシャツ/カットソー(半袖/袖なし)"}, {:name=>"Tシャツ/カットソー(七分/長袖)"},{:name=>"その他"}])
men_jacket.children.create([{:name=>"テーラードジャケット"}, {:name=>"ノーカラージャケット"}, {:name=>"Gジャン/デニムジャケット"},{:name=>"その他"}])
child_tops.children.create([{:name=>"Tシャツ/カットソー(半袖/袖なし)"}, {:name=>"Tシャツ/カットソー(七分/長袖)"},{:name=>"その他"}])
child_jacket.children.create([{:name=>"テーラードジャケット"}, {:name=>"ノーカラージャケット"}, {:name=>"Gジャン/デニムジャケット"},{:name=>"その他"}])



# category0_mat=[{name:"レディース"},
#                 {name:"メンズ"},
#                 {name:"家電・スマホ・カメラ"},
#                 {name:"おもちゃ・ホビー・グッズ"}]

# category1_mat=[{name:"トップス",category0_id:1},
#                 {name:"アウター",category0_id:1},
#                 {name:"パンツ",category0_id:1},
#                 {name:"スカート",category0_id:1},
#                 {name:"ワンピース",category0_id:1},
#                 {name:"シューズ",category0_id:1},
#                 {name:"バッグ",category0_id:1},
#                 {name:"トップス",category0_id:2},
#                 {name:"アウター",category0_id:2},
#                 {name:"パンツ",category0_id:2},
#                 {name:"シューズ",category0_id:2},
#                 {name:"バッグ",category0_id:2},
#                 {name:"スマホ",category0_id:3},
#                 {name:"デジカメ",category0_id:3},
#                 {name:"テレビ",category0_id:3},
#                 {name:"おもちゃ",category0_id:4},
#                 {name:"タレントグッズ",category0_id:4}]

# category2_mat=[{name:"Tシャツ",category1_id:1},
#                 {name:"ロンT",category1_id:1},
#                 {name:"ジャケット",category1_id:2},
#                 {name:"コート",category1_id:2},
#                 {name:"スキニーパンツ",category1_id:3},
#                 {name:"フレアパンツ",category1_id:3},
#                 {name:"プリーツスカート",category1_id:4},
#                 {name:"ノースリーブワンピース",category1_id:5},
#                 {name:"ドレスシューズ",category1_id:6},
#                 {name:"スニーカー",category1_id:6},
#                 {name:"レザーバッグ",category1_id:7},
#                 {name:"リュック",category1_id:7},
#                 {name:"Tシャツ",category1_id:8},
#                 {name:"ロンT",category1_id:8},
#                 {name:"ジャケット",category1_id:9},
#                 {name:"コート",category1_id:9},
#                 {name:"スキニーパンツ",category1_id:10},
#                 {name:"フレアパンツ",category1_id:10},
#                 {name:"ドレスシューズ",category1_id:11},
#                 {name:"スニーカー",category1_id:11},
#                 {name:"レザーバッグ",category1_id:12},
#                 {name:"リュック",category1_id:12},
#                 {name:"iPhone",category1_id:13},
#                 {name:"もっとデジカメ",category1_id:14},
#                 {name:"47型",category1_id:15},
#                 {name:"特撮ヒーロー",category1_id:16},
#                 {name:"アイドル",category1_id:17}]

# Category0.create!(category0_mat)
# Category1.create!(category1_mat)
# Category2.create!(category2_mat)