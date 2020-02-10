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
  $("#parent-form").on("change", function () {
    var parentValue = document.getElementById("parent-form").value;
    if (parentValue != "") {
      $.ajax({
        url: '/items/new',
        type: "GET",
        data: { parent_id: parentValue },
        dataType: 'json'
      }).done(function (children) {
        var categories = '';
        children.forEach(function (child) {
          var category = buildcategory(child);
          categories += category;
        });
        var html = buildHTML(categories);
        $("#parent-form2").remove();
        $(".contents-item_select_right_category").append(html);
        $("#parent-form2").on("change", function () {
          var parentValue2 = document.getElementById("parent-form2").value;
          if (parentValue2 != "") {
            $.ajax({
              url: '/items/new',
              type: "GET",
              data: { parent_id: parentValue2 },
              dataType: 'json'
            }).done(function (children) {
              var categories = '';
              children.forEach(function (child) {
                var category = buildcategory(child);
                categories += category;
              });
              var html = buildHTML2(categories);
              $("#parent-form3").remove();
              $(".contents-item_select_right_category").append(html);
              var parentValue3 = document.getElementById("parent-form3").value;
              if (parentValue3 != "") {
                $.ajax({
                  url: '/items/new',
                  type: "GET",
                  data: { parent_id: parentValue3 },
                  dataType: 'json'
                })
              }
            }).fail(function () {
              alert("failed");
            });
          } else {
            $("#parent-form3").remove();
          }
        });
      });
    } else {
      $("#parent-form2").remove();
      $("#parent-form3").remove();
    }
  });
  $(".modal_sell").click(function(){
    var category=$("#parent-form3").value;
    if(category.length!=0){
    $("#parent-form").empty();
    var test = `<option value='${category}'></option>`
    $('#parent-form').append(test)
    }
  });
});
