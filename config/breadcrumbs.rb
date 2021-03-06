crumb :root do
  link "メルカリ", root_path
end

crumb :mypage do
  link "マイページ",mypage_mypages_path
end

crumb :profile do
  link "プロフィール",profile_users_path
  parent :mypage
end

crumb :card1 do
  link "お支払い方法",card_mypages_path
  parent :mypage
end

crumb :card2 do
  link "お支払い方法",new_card_path
  parent :mypage
end

crumb :card3 do
  link "お支払い方法",card_path
  parent :mypage
end

crumb :user_comfirm do
  link "本情情報",user_path
  parent :mypage
end

crumb :logout do
  link "ログアウト",mypagelogout_mypages_path
  parent :mypage
end

crumb :exhibition do
  link "出品した商品-出品中",exhibition_mypages_path
  parent :mypage
end

crumb :trans do
  link "出品した商品-取引中",trans_mypages_path
  parent :mypage
end

crumb :complete do
  link "出品した商品-売却済み",complete_mypages_path
  parent :mypage
end

crumb :negotiate do
  link "購入した商品-取引中",negotiate_mypages_path
  parent :mypage
end

crumb :purchased do
  link "購入した商品-過去の取引",purchased_mypages_path
  parent :mypage
end

crumb :voucher do
  link "クーポン",voucher_mypages_path
  parent :mypage
end

crumb :sales do
  link "売り上げ",sales_mypages_path
  parent :mypage
end

crumb :point do
  link "ポイント",point_mypages_path
  parent :mypage
end

crumb :items do |item|
  if  ( item.status=="complete" && item.user_id==current_user.id )
    link "取引画面", item_path
    parent :complete
  elsif ( item.status=="trans" && item.user_id==current_user.id )
    link "取引画面", item_path
    parent :trans
  elsif ( item.status=="exhibition" && item.user_id==current_user.id )
    link "出品商品画面", item_path
    parent :exhibition
  elsif  ( item.status=="complete" && item.buyer==current_user.id )
      link "取引画面", item_path
      parent :purchased
  elsif ( item.status=="trans" && item.buyer==current_user.id )
    link "取引画面", item_path
    parent :negotiate
  end
end

crumb :category do
  link "カテゴリー一覧",category_categories_path
end

crumb :category0 do |category|
  link category.name,category_root_categories_path(category.id)
  parent :category
end

crumb :category1 do |category|
  link category.name,category_child_categories_path(category.id)
  parent :category0,category.parent
end

crumb :category2 do |category|
  link category.name,category_grandchild_categories_path(category.id)
  parent :category1,category.parent
end


# これ以降はまだ実装していない

# crumb :brand do
#   link "ブランド一覧",
# end




# crumb :projects do
#   link "Projects", projects_path
# end

# crumb :project do |project|
#   link project.name, project_path(project)
#   parent :projects
# end

# crumb :project_issues do |project|
#   link "Issues", project_issues_path(project)
#   parent :project, project
# end

# crumb :issue do |issue|
#   link issue.title, issue_path(issue)
#   parent :project_issues, issue.project
# end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).