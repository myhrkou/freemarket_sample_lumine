$(function () {
  var buildHTML = function (name, code) {
    var html = `
                <div class="modal">
                  <div class="modal__window">
                    <div class="modal__window__vouchertext">
                      <div class="modal__window__vouchertext__name">
                        ${name}
                      </div>
                      <div class="modal__window__vouchertext__code">
                        ${code}
                      </div>
                      <div class="modal__window__vouchertext__close">
                        &#215;
                      </div>
                    </div>
                  </div>
                </div>
              `
    return html;
  };

  $(".voucher").click(function () {
    var name = $(".voucher_name").val();
    var code = $(".voucher_code").val();
    $(".html").append(buildHTML(name, code));
    $(".voucher").fadeOut();
    $(".modal").fadeIn();
  });
  $(document).on("click", ".modal__window__vouchertext__close", function () {
    $(".modal").fadeOut(function () {
      $(".modal").remove();
    });
  });

  $(".voucher").animate({ "left": "5" }, 1500);

  $("#voucher_false").change(function () {
    if (document.getElementById("voucher_false").checked) {
      document.getElementById("voucher_true").checked = false;
      $(".code_box").hide();
      $(".code_button").hide();
      $(".pay__main__center__all__voucherresult").remove();
      $(".pay__main__center__all__price__num").show();
      $(".pay__main__center__all__price__num__voucher").empty();
      $(".voucher_result").remove();
      $("#flag").val(0).change();
      $("#voucher_id").attr("action", "/items/pay");
    } else {
      document.getElementById("voucher_true").checked = true;
      $(".code_box").show();
      $(".code_button").show();
      $(".voucher_result").remove();
    }
  });
  $("#voucher_true").change(function () {
    if (document.getElementById("voucher_true").checked) {
      document.getElementById("voucher_false").checked = false;
      $(".code_box").show();
      $(".code_button").show();
      $(".voucher_result").remove();
    } else {
      document.getElementById("voucher_false").checked = true;
      $(".code_box").hide();
      $(".code_button").hide();
      $(".pay__main__center__all__voucherresult").remove();
      $(".pay__main__center__all__price__num").show();
      $(".pay__main__center__all__price__num__voucher").empty();
      $(".voucher_result").remove();
      $("#flag").val(0).change();
      $("#voucher_id").attr("action", "/items/pay");
    }
  });

  $("#code_button").click(function () {
    $(".voucher_result").remove();
    var url = location.href;
    var code_value = document.getElementById("code_box").value;
    if (code_value != "") {
      $.ajax({
        url: url,
        type: "GET",
        data: { code: code_value },
        dataType: "json"
      }).done(function (vouchers) {
        var realprice=$(".price").val();
        vouchers.forEach(function (voucher) {
          $(".voucher_result").remove();
          if (code_value == voucher.code) {
            alert(voucher.name);
            $(".pay__main__center__all__voucher__true").append(`<div class="voucher_result">クーポンコードが適用されました</div>`);
            $(".pay__main__center__all__voucherresult").remove();
            $(".pay__main__center__all__voucher").after(`<div class="pay__main__center__all__voucherresult">
                                                        <div class="pay__main__center__all__voucherresult__title">
                                                          割引額
                                                        </div>
                                                        <div class="pay__main__center__all__voucherresult__price">
                                                          ¥${voucher.price.toLocaleString()}
                                                        </div>
                                                      </div>`)
          
            var price = realprice - realprice;
            if (price < 0) {
              price = 0;
            }
            $(".pay__main__center__all__price__num").hide();
            $(".pay__main__center__all__price__num__voucher").empty();
            $(".pay__main__center__all__price__num__voucher").append(`¥${price.toLocaleString()}`);
            var id = voucher.id;
            $("#flag").val(id).change();
            var url = location.href;
            $.ajax({
              url: url,
              type: "GET",
              data: { code: id },
              dataType: "json"
            }).done(function () {
              $("voucher_id").attr("action", `/items/${id}/pay`);
            }).fail(function () {
              alert("failedddddd");
            });
          } else {
            $(".pay__main__center__all__voucher__true").append(`<div class="voucher_result">クーポンコードが不正です</div>`);
            $("#flag").val(0).change();
            $("#voucher_id").attr("action", "/items/pay");
          }
        });
      }).fail(function () {
        alert("failedaaaaaa");
      });
    }
  });
  $("#flag").change(function () {
    var voucher_flag = document.getElementById("flag").value.toString();
    var url = location.href;
    alert(voucher_flag);
    $.ajax({
      url: url,
      type: "GET",
      data: { flag: voucher_flag },
      dataType: "json"
    }).done(function () {
      if (voucher_flag == 0) {
        $("#voucher_id").attr("action", "/items/pay");
      } else {
        $("#voucher_id").attr("action", `/items/${voucher_flag}/pay`);
      }
    }).fail(function () {
      alert("failed");
    });
  });
});