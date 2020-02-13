$(function () {
  $(".price_selecter").change(function () {
    var num = document.getElementById("price_selecter").value;
    if (num == 1) {
      document.getElementById("price_field_lower").value = 300
      document.getElementById("price_field_upper").value = 1000
    } else if (num == 2) {
      document.getElementById("price_field_lower").value = 1000
      document.getElementById("price_field_upper").value = 5000
    } else if (num == 3) {
      document.getElementById("price_field_lower").value = 5000
      document.getElementById("price_field_upper").value = 10000
    } else if (num == 4) {
      document.getElementById("price_field_lower").value = 10000
      document.getElementById("price_field_upper").value = 30000
    } else if (num == 5) {
      document.getElementById("price_field_lower").value = 30000
      document.getElementById("price_field_upper").value = 50000
    } else if (num == 6) {
      document.getElementById("price_field_lower").value = 50000
      document.getElementById("price_field_upper").value = ""
    } else {
      document.getElementById("price_field_lower").value = ""
      document.getElementById("price_field_upper").value = ""
    }
  });
  $("#condition_box_all").change(function () {
    if (document.getElementById("condition_box_all").checked) {
      document.getElementById("condition_box0").checked = true;
      document.getElementById("condition_box1").checked = true;
      document.getElementById("condition_box2").checked = true;
      document.getElementById("condition_box3").checked = true;
      document.getElementById("condition_box4").checked = true;
      document.getElementById("condition_box5").checked = true;
    } else {
      document.getElementById("condition_box0").checked = false;
      document.getElementById("condition_box1").checked = false;
      document.getElementById("condition_box2").checked = false;
      document.getElementById("condition_box3").checked = false;
      document.getElementById("condition_box4").checked = false;
      document.getElementById("condition_box5").checked = false;
    };
  });
  $(".condition_box").change(function () {
    if (document.getElementById("condition_box0").checked && document.getElementById("condition_box1").checked && document.getElementById("condition_box2").checked && document.getElementById("condition_box3").checked && document.getElementById("condition_box4").checked && document.getElementById("condition_box5").checked) {
      document.getElementById("condition_box_all").checked = true;
    } else {
      document.getElementById("condition_box_all").checked = false;
    }
  });
  $("#charge_box_all").on("click", function () {
    if (document.getElementById("charge_box_all").checked) {
      document.getElementById("charge_box0").checked = true;
      document.getElementById("charge_box1").checked = true;
    } else {
      document.getElementById("charge_box0").checked = false;
      document.getElementById("charge_box1").checked = false;
    };
  });
  $(".charge_box").change(function () {
    if (document.getElementById("charge_box0").checked && document.getElementById("charge_box1").checked) {
      document.getElementById("charge_box_all").checked = true;
    } else {
      document.getElementById("charge_box_all").checked = false;
    }
  });
  $("#status_box_all").change(function () {
    if (document.getElementById("status_box_all").checked) {
      document.getElementById("status_box0").checked = true;
      document.getElementById("status_box1").checked = true;
    } else {
      document.getElementById("status_box0").checked = false;
      document.getElementById("status_box1").checked = false;
    };
  });
  $(".status_box").change(function () {
    if (document.getElementById("status_box0").checked && document.getElementById("status_box1").checked) {
      document.getElementById("status_box_all").checked = true;
    } else {
      document.getElementById("status_box_all").checked = false;
    }
  });
});