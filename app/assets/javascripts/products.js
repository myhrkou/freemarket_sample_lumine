$(function () {
  // 画像用のinputを生成する関数
  const buildFileField = (index) => {
    const html = `<input class="js-file" type="file"
                      name="item[items_images_attributes][${index}][image_url]"
                      id="items_images_attributes_${index}_image_url">`;
    return html;
  }
  const buildImg = (index, url) => {
    const html = `<div class="js-img" data-index="${index}">
                    <img  data-index="${index}" src="${url}" class="js-data" width="100px" height="100px">
                    <div id="preview_menus">
                    <div class="js-remove">削除</div><div class="js-edit">編集</div>
                    </div>
                  </div>`;
    return html;
  }
  // file_fieldのnameに動的なindexをつける為の配列
  let fileIndex = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  lastIndex = $('.js-file_group:last').data('index');
  fileIndex.splice(0, lastIndex);
  $('#image-box').on('change', '.js-file1', function (e) {
    $(".js-file1").removeAttr("for");
    $(".js-file1").attr("for", `items_images_attributes_${fileIndex[0]}_image_url`);
    // ファイルのブラウザ上でのURLを取得する
    if (e.target.files[0]) {
      const file = e.target.files[0];
      const blobUrl = window.URL.createObjectURL(file);
      $('#previews').append(buildImg(fileIndex[0], blobUrl));
    };
    // fileIndexの先頭の数字を使ってinputを作る
    $('.js-file1').append(buildFileField(fileIndex[0]));
    fileIndex.shift();
    // 末尾の数に1足した数を追加する
    fileIndex.push(fileIndex[fileIndex.length - 1] + 1);
  });
  $('#image-box').on('click', '.js-remove', function () {
    const targetIndex = $(this).parents(".js-img").data("index");
    // 該当indexを振られているチェックボックスを取得する
    const hiddenCheck = $(`input[data-index="${targetIndex}"].hidden-destroy`);
    // もしチェックボックスが存在すればチェックを入れる
    if (hiddenCheck) hiddenCheck.prop('checked', true);
    $(this).parents(".js-img").remove();
    $(`img[data-index="${targetIndex}"]`).remove();
    if (location.href.match(/new/)){
      if (targetIndex == 1){
        $(`#item_items_images_attributes_0_image_url`).remove();
      } else{
        $(`#items_images_attributes_${targetIndex - 1}_image_url`).remove();
      }
    } else{
      $(`#item_items_images_attributes_${targetIndex}_image_url`).remove();
    }
  });
});