$(function () {
  $(".modal").hide();
  $(".modal_button").click(function (e) {
    e.preventDefault();
    $(".modal").fadeIn();
    $(".modal__window__button__no").click(function (e) {
      e.preventDefault();
      $(".modal").fadeOut();
    });
    $(".modal__window__button__yes").click(function (e) {
      e.preventDefault();
      $("#delete_button").click();
    });
  });

  var buildHTML = function (item) {
    var html = `
                <div class="modal">
                  <div class="modal__window">
                    <div class="modal__window__text">
                      <div class="modal__window__text__title">
                        出品が完了しました
                      </div>
                      <div class="modal__window__text__detail">
                        <br />
                        <br />
                        あなたが出品した商品は
                        <br />「出品した商品」からいつでも見ることができます。</div>
                    </div>
                    <div class="modal__window__button__sell">
                      <div class="modal__window__button__sell__new">
                        <a href="/items/new" class="modal__window__button__sell__new__button"></a>
                        続けて出品する
                      </div>
                    </div>
                    <div class="modal__window__button__show">
                      <div class="modal__window__button__sell__show">
                        <a href="/items/${item.id}" class="modal__window__button__sell__show__button"></a>
                        商品ページに移動する
                      </div>
                    </div>
                  </div>
                </div>
              `
    return html;
  };
  var error_column = function (name) {
    var html = `
              <li>${name}を入力してください</li>
              `
    return html;
  }
  var builderror = function (column) {
    var html = `<div class="alert"
                  <ul>
                    ${column}
                  </ul>
                </div>`
    return html;
  };
  $("#new_item").submit(function (e) {
    e.preventDefault();
    var formData = new FormData(this);
    var url = $(this).attr("action");
    $.ajax({
      url: url,
      type: "POST",
      data: formData,
      dataType: "json",
      processData: false,
      contentType: false
    }).done(function (item) {
      $(".alert").remove()
      if (item.id != null) {
        $(".new_item").append(buildHTML(item));
        $(".modal").fadeIn();
      } else {
        var errors = "";
        if (item.items_images == null) {
          errors += error_column("商品画像");
        }
        if (item.name == null) {
          errors += error_column("商品名");
        }
        if (item.description == null) {
          errors += error_column("商品の説明");
        }
        if (item.category_id == null) {
          errors += error_column("カテゴリー");
        }
        if (item.condition == null) {
          errors += error_column("商品の状態");
        }
        if(item.delivery_charge_detail==null){
          errors+=error_column("配送料の負担")
        }
        if (item.delivery_origin == null) {
          errors += error_column("発送元の地域");
        }
        if(item.delivery_date==null){
          errors+=error_column("発送までの日数")
        }
        if (item.price == null) {
          errors += error_column("販売価格");
        }
        $(".contents").prepend(builderror(errors));
        $('body,html').animate({ scrollTop: 0 }, 500);
        $(".form_sell").removeAttr("disabled");
      }
    }).fail(function () {
      alert("failed");
    });
  });
});