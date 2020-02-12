$(function(){
  function addtax(tax){
    const html=`${tax}`
    return html;
  }

  function addprofit(profit){
    const html=`${profit}`
    return html;
  }

  function taxresult(){
    $('.contents-price_right_tax_result').empty();
    var toString = Object.prototype.toString
    var money =$("#item_price").val();
    if (!isNaN(money) && money != "") {
      var tax = money*0.1
      tax=Math.floor(tax)
      html=addtax(tax);
    } else {
      var tax="-";
      html=addtax(tax);
    }
    $('.contents-price_right_tax_result').append(html);
  }

  function profitresult(){
    $('.contents-price_profit_result').empty();
    var toString = Object.prototype.toString
    var money =$("#item_price").val();
    if (!isNaN(money) && money != "")  {
      var profit = money-money*0.1
      profit=Math.floor(profit)
      html=addprofit(profit);
    } else {
      profit="-";
      html=addprofit(profit);
    }
    $('.contents-price_profit_result').append(html);
  }

  $('#new_item').on("keyup",function() {
    taxresult()
  });

  $('#new_item').on("keyup",function() {
    profitresult()
  });

  $('.edit_item').on("keyup",function() {
    taxresult()
  });

  $('.edit_item').on("keyup",function() {
    profitresult()
  });
});