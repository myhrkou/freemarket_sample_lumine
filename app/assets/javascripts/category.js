$(function () {
  $(".header__bottom__left__category").hover(function () {
    $(".category0s").show();
  }, function () {
    $(".category0s").hide();
  })

  $(".category0").hover(function () {
    $(this).children(".category1s").show();
  }, function () {
    $(this).children(".category1s").hide();
  })

  $(".category1").hover(function () {
    $(this).children(".category2s").show();
  }, function () {
    $(this).children(".category2s").hide();
  })

  var buildcategory = function (child) {
    var html = `<option value='${child.id}'>${child.name}</option>`
    return html;
  };
  var buildHTML = function (categories) {
    var html = `
            <select class='select-default' id='parent-form2' name="item[category_id]">
              <option value=''>---</option>
              ${categories}
            </select>
              `
    return html;
  };
  var buildHTML2 = function (categories) {
    var html = `
            <select class='select-default' id='parent-form3' name="item[category_id]">
              <option value=''>---</option>
              ${categories}
            </select>
              `
    return html;
  }
  var buildHTML3 = function (categories) {
    var html = `
            <select class='select-default' id='parent-form2' name="item[category_id]">
              <option value=''>すべて</option>
              ${categories}
            </select>
              `
    return html;
  };
  var buildHTML4 = function (categories) {
    var html = `
            <select class='select-default' id='parent-form3' name="item[category_id]">
              <option value=''>すべて</option>
              ${categories}
            </select>
              `
    return html;
  }
  if (location.href.match(/edit/|/search/)) {
    $("#parent-form2").on("change", function () {
      url = location.href;
      var parentValue2 = document.getElementById("parent-form2").value;
      if (parentValue2 != "") {
        $.ajax({
          url: url,
          type: "GET",
          data: { parent_id: parentValue2 },
          dataType: 'json'
        }).done(function (children) {
          var categories = '';
          children.forEach(function (child) {
            var category = buildcategory(child);
            categories += category;
          });
          if (url.match("search")) {
            var html = buildHTML4(categories);
          } else {
            var html = buildHTML2(categories);
          }
          $("#parent-form3").remove();
          $(".contents-item_select_right_category").append(html);
          $(".contents__searchscreen__left__form__category").append(html);
        }).fail(function () {
          alert("failed");
        });
      } else {
        $("#parent-form3").remove();
      }
    });
  }
  $("#parent-form").on("change", function () {
    var parentValue = document.getElementById("parent-form").value;
    url = location.href;
    if (parentValue != "") {
      $.ajax({
        url: url,
        type: "GET",
        data: { parent_id: parentValue },
        dataType: 'json'
      }).done(function (children) {
        var categories = '';
        children.forEach(function (child) {
          var category = buildcategory(child);
          categories += category;
        });
        if (url.match("search")) {
          var html = buildHTML3(categories);
        } else {
          var html = buildHTML(categories);
        }
        $("#parent-form2").remove();
        $("#parent-form3").remove();
        $(".contents-item_select_right_category").append(html);
        $(".contents__searchscreen__left__form__category").append(html);
        $("#parent-form2").on("change", function () {
          var parentValue2 = document.getElementById("parent-form2").value;
          if (parentValue2 != "") {
            $.ajax({
              url: url,
              type: "GET",
              data: { parent_id: parentValue2 },
              dataType: 'json'
            }).done(function (children) {
              var categories = '';
              children.forEach(function (child) {
                var category = buildcategory(child);
                categories += category;
              });
              if (url.match("search")) {
                var html = buildHTML4(categories);
              } else {
                var html = buildHTML2(categories);
              }
              $("#parent-form3").remove();
              $(".contents-item_select_right_category").append(html);
              $(".contents__searchscreen__left__form__category").append(html);
            }).fail(function () {
              alert("failed");
            });
          } else {
            $("#parent-form3").remove();
          }
        });
      }).fail(function () {
        alert("failed");
      });
    } else {
      $("#parent-form2").remove();
      $("#parent-form3").remove();
    }
  });

  $(".form_edit").click(function () {
    var category = $("#parent-form3").value;
    if (category.length != 0) {
      $("#parent-form").empty();
      var result = `<option value='${category}'></option>`
      $('#parent-form').append(result)
    }
  });

  $("#search_button").click(function () {
    var category3 = document.getElementById("parent-form3").value;
    var category2 = document.getElementById("parent-form2").value;
    if (category3.length != 0) {
      $("#parent-form").empty();
      var result = `<option value='${category3}'></option>`
      $('#parent-form').append(result)
    } else if (category2.length != 0) {
      $("#parent-form").empty();
      var result = `<option value='${category2}'></option>`
      $('#parent-form').append(result)
    }
  });

  $("#search_reset").click(function () {
    $("#parent-form2").remove();
    $("#parent-form3").remove();
  })
});
