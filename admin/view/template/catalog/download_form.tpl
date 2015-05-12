<?php echo $header; ?>
<div id="content" class="container">
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>
  <?php if ($error_warning) { ?>
  <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
    <button type="button" class="close" data-dismiss="alert">&times;</button>
  </div>
  <?php } ?>
  <div class="panel panel-default">
    <div class="panel-heading">
      <div class="pull-right">
        <button type="submit" form="form-download" class="btn btn-primary "><i class="fa fa-check"></i> <?php echo $button_save; ?></button>
        <a href="<?php echo $cancel; ?>" class="btn btn-danger "><i class="fa fa-times"></i> <?php echo $button_cancel; ?></a></div>
      <h1 class="panel-title"><i class="fa fa-edit"></i> <?php echo $heading_title; ?></h1>
    </div>
    <div class="panel-body">
      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-download" class="form-horizontal">
        <div class="form-group required">
          <label class="col-xs-2 control-label"><?php echo $entry_name; ?></label>
          <div class="col-xs-10">
            <?php foreach ($languages as $language) { ?>
            <div class="input-group"> <span class="input-group-addon"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /></span>
              <input type="text" name="download_description[<?php echo $language['language_id']; ?>][name]" value="<?php echo isset($download_description[$language['language_id']]) ? $download_description[$language['language_id']]['name'] : ''; ?>" class="form-control" />
            </div>
            <?php if (isset($error_name[$language['language_id']])) { ?>
            <div class="text-danger"><?php echo $error_name[$language['language_id']]; ?></div>
            <?php } ?>
            <?php } ?>
          </div>
        </div>
        <div class="form-group">
          <label class="col-xs-2 control-label" for="input-filename"><?php echo $entry_filename; ?></label>
          <div class="col-xs-10">
            <div class="input-group">
              <input type="text" name="filename" value="<?php echo $filename; ?>" id="input-filename" class="form-control" />
              <span class="input-group-btn">
              <button type="button" onclick="$('input[name=\'file\']').click();" id="button-upload" class="btn btn-primary"><i class="fa fa-upload"></i> <?php echo $button_upload; ?></button>
              </span></div>
            
            <?php if ($error_filename) { ?>
            <div class="text-danger"><?php echo $error_filename; ?></div>
            <?php } ?>
          </div>
        </div>
        <div class="form-group">
          <label class="col-xs-2 control-label" for="input-mask"><?php echo $entry_mask; ?></label>
          <div class="col-xs-10">
            <input type="text" name="mask" value="<?php echo $mask; ?>" id="input-mask" class="form-control" />
            
            <?php if ($error_mask) { ?>
            <div class="text-danger"><?php echo $error_mask; ?></div>
            <?php } ?>
          </div>
        </div>
        <div class="form-group">
          <label class="col-xs-2 control-label" for="input-remaining"><?php echo $entry_remaining; ?></label>
          <div class="col-xs-10">
            <input type="text" name="remaining" value="<?php echo $remaining; ?>" id="input-remaining" class="form-control" />
          </div>
        </div>
        <?php if ($download_id) { ?>
        <div class="form-group">
          <label class="col-xs-2 control-label" for="input-update"><?php echo $entry_update; ?></label>
          <div class="col-xs-10">
            <?php if ($update) { ?>
            <input type="checkbox" name="update" value="1" checked="checked" id="input-update" />
            <?php } else { ?>
            <input type="checkbox" name="update" value="1" id="input-update" />
            <?php } ?>
            </div>
        </div>
        <?php } ?>
      </form>
    </div>
  </div>
</div>
<div style="display: none;">
  <form enctype="multipart/form-data">
    <input type="file" name="file" id="file" />
  </form>
</div>
<script type="text/javascript"><!--
$('#file').on('change', function() {
    $.ajax({
        url: 'index.php?route=catalog/download/upload&token=<?php echo $token; ?>',
        type: 'post',		
		dataType: 'json',
		data: new FormData($(this).parent()[0]),
		cache: false,
		contentType: false,
		processData: false,		
		beforeSend: function() {
			$('#button-upload i').replaceWith('<i class="fa fa-spinner fa-spin"></i>');
			$('#button-upload').prop('disabled', true);
		},	
		complete: function() {
			$('#button-upload i').replaceWith('<i class="fa fa-upload"></i>');
			$('#button-upload').prop('disabled', false);
		},		
		success: function(json) {
			if (json['error']) {
				alert(json['error']);
			}
						
			if (json['success']) {
				alert(json['success']);
				
				$('input[name=\'filename\']').attr('value', json['filename']);
				$('input[name=\'mask\']').attr('value', json['mask']);
			}
		},			
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
    });
});
//--></script> 
<script type="text/javascript">
var isCtrl = false;
$(document).keyup(function (e) {
 if(e.which == 17) isCtrl=false;
}).keydown(function (e) {
    if(e.which == 17) isCtrl=true;
    if(e.which == 83 && isCtrl == true) {
        $('#content > div > div.panel-heading > div > button').trigger('click');
    return false;
 }
});
</script>
<?php echo $footer; ?>