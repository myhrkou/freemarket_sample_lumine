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

  $("#point_false").change(function () {
    if (document.getElementById("point_false").checked) {
      document.getElementById("point_true").checked = false;
      $(".point_field").hide();
      $(".point_button").hide();
      $(".pay__main__center__all__pointresult").remove();
      $(".pay__main__center__all__price__num").show();
      $(".pay__main__center__all__price__num__voucher").empty();
      $(".point_result").remove();
    } else {
      document.getElementById("point_true").checked = true;
      $(".point_field").show();
      $(".point_button").show();
      $(".point_result").remove();
    }
  });
  $("#point_true").change(function () {
    if (document.getElementById("point_true").checked) {
      document.getElementById("point_false").checked = false;
      $(".point_field").show();
      $(".point_button").show();
      $(".point_result").remove();
    } else {
      document.getElementById("point_false").checked = true;
      $(".point_field").hide();
      $(".point_button").hide();
      $(".pay__main__center__all__pointresult").remove();
      $(".pay__main__center__all__price__num").show();
      $(".pay__main__center__all__price__num__voucher").empty();
      $(".point_result").remove();
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
        var realprice = $(".price").val();
        vouchers.some(function (voucher) {
          $(".voucher_result").remove();
          if (code_value == voucher.code) {
            $(".pay__main__center__all__voucherresult").remove();
            $(".pay__main__center__all__voucher__true").append(`<div class="voucher_result">クーポンコードが適用されました</div>`);
            $(".pay__main__center__all__voucher").after(`<div class="pay__main__center__all__voucherresult">
                                                        <div class="pay__main__center__all__voucherresult__title">
                                                          ${voucher.name}
                                                        </div>
                                                        <div class="pay__main__center__all__voucherresult__price">
                                                          ¥${voucher.price.toLocaleString()}
                                                        </div>
                                                      </div>`)
            var price = realprice - voucher.price;
            if (price < 0) {
              price = 0;
            }
            $(".pay__main__center__all__price__num").hide();
            $(".pay__main__center__all__price__num__voucher").empty();
            $(".pay__main__center__all__price__num__voucher").append(`¥${price.toLocaleString()}`);
            var id = voucher.id;
            $("voucher_id").attr("action", `/items/${id}/pay`);
            var url = location.href;
            $.ajax({
              url: url,
              type: "GET",
              data: { code: id },
              dataType: "json"
            }).done(function () {
              pre_price = document.getElementById("price").value
              document.getElementById("price").value = price;
              $("#flag").val(id).change();
              $("voucher_id").attr("action", `/items/${id}/pay`);
              $("#code_button").prop("disabled", true);
              if(document.getElementById("price").value==0){
                $("#point_button").prop("disabled", true);
              }
              $("#voucher_false").hide();
              $(".voucher_false_label").hide();
              $(".reload_button").show();
            }).fail(function () {
              alert("failedddddd");
            });
            return true;
          } else {
            $(".pay__main__center__all__voucherresult").remove();
            $(".pay__main__center__all__price__num").show();
            $(".pay__main__center__all__price__num__voucher").empty();
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

  $("#point_button").click(function () {
    $(".point_result").remove();
    var url = location.href;
    var point_value = document.getElementById("point_field").value;
    if (point_value != "") {
      $.ajax({
        url: url,
        type: "GET",
        data: { code: point_value },
        dataType: "json"
      }).done(function () {
        var realprice = $(".price").val();
        var point_max = $("#point_field").attr("max");
        $(".point_result").remove();
        if (parseInt(point_max) >= parseInt(point_value)) {
          $(".pay__main__center__all__pointresult").remove();
          $(".pay__main__center__all__point__true").append(`<div class="point_result">ポイントが適用されました</div>`);
          $(".pay__main__center__all__point").after(`<div class="pay__main__center__all__pointresult">
                                                        <div class="pay__main__center__all__pointresult__title">
                                                          ポイント
                                                        </div>
                                                        <div class="pay__main__center__all__pointresult__price">
                                                          ${point_value.toLocaleString()} P
                                                        </div>
                                                      </div>`)
          var price = parseInt(realprice) - parseInt(point_value);
          if (price < 0) {
            price = 0;
          }
          $(".pay__main__center__all__price__num").hide();
          $(".pay__main__center__all__price__num__voucher").empty();
          $(".pay__main__center__all__price__num__voucher").append(`¥${price.toLocaleString()}`);
          var url = location.href;
          $.ajax({
            url: url,
            type: "GET",
            data: { point: point_value },
            dataType: "json"
          }).done(function () {
            pre_price = document.getElementById("price").value
            document.getElementById("price").value = price;
            $("#point_button").prop("disabled", true);
            if(document.getElementById("price").value==0){
              $("#code_button").prop("disabled", true);
            }
            $("#point_false").hide();
            $(".point_false_label").hide();
            $(".reload_button").show();
          }).fail(function () {
            alert("failedddddd");
          });
        } else {
          $(".pay__main__center__all__pointresult").remove();
          $(".pay__main__center__all__price__num").show();
          $(".pay__main__center__all__price__num__voucher").empty();
          $(".pay__main__center__all__point__true").append(`<div class="point_result">ポイントが適用されませんでした</div>`);
        }
      }).fail(function () {
        alert("failedaaaaaa");
      });
    }
  });
});