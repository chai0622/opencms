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
        <button type="submit" form="form-paymate" class="btn btn-primary "><i class="fa fa-check"></i> <?php echo $button_save; ?></button>
        <a href="<?php echo $cancel; ?>" class="btn btn-danger "><i class="fa fa-times"></i> <?php echo $button_cancel; ?></a></div>
      <h1 class="panel-title"><i class="fa fa-edit"></i> <?php echo $heading_title; ?></h1>
    </div>
    <div class="panel-body">
      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-paymate" class="form-horizontal">
        <div class="form-group required">
          <label class="col-xs-2 control-label" for="input-username"><?php echo $entry_username; ?></label>
          <div class="col-xs-10">
            <input type="text" name="paymate_username" value="<?php echo $paymate_username; ?>" id="input-username" class="form-control" />
            <?php if ($error_username) { ?>
            <div class="text-danger"><?php echo $error_username; ?></div>
            <?php } ?>
          </div>
        </div>
        <div class="form-group required">
          <label class="col-xs-2 control-label" for="input-password"><?php echo $entry_password; ?></label>
          <div class="col-xs-10">
            <input type="text" name="paymate_password" value="<?php echo $paymate_password; ?>" id="input-password" class="form-control" />

            <?php if ($error_password) { ?>
            <div class="text-danger"><?php echo $error_password; ?></div>
            <?php } ?>
          </div>
        </div>
        <div class="form-group">
          <label class="col-xs-2 control-label"><?php echo $entry_test; ?></label>
          <div class="col-xs-10">
		<div class="btn-group" data-toggle="buttons">

  			<label class="btn btn-primary<?php if ($paymate_test == 1) { ?> active<?php } ?>">
    				<i class="fa fa-check"></i> <input type="radio" name="paymate_test" value="1" <?php if ($paymate_test == 1) { ?>checked="checked"<?php } ?>> <?php echo $text_yes; ?>
  			</label>
  			<label class="btn btn-primary<?php if ($paymate_test == 0) { ?> active<?php } ?>">
    				<i class="fa fa-times"></i> <input type="radio" name="paymate_test" value="0" <?php if ($paymate_test == 0) { ?>checked="checked"<?php } ?>> <?php echo $text_no; ?>
  			</label>
		</div>
          </div>
        </div>
        <div class="form-group">
          <label class="col-xs-2 control-label" for="input-total"><?php echo $entry_total; ?></label>
          <div class="col-xs-10">
            <input type="text" name="paymate_total" value="<?php echo $paymate_total; ?>" id="input-total" class="form-control" />
	 </div>
        </div>
        <div class="form-group">
          <label class="col-xs-2 control-label" for="input-order-status"><?php echo $entry_order_status; ?></label>
          <div class="col-xs-10">
            <select name="paymate_order_status_id" id="input-order-status" class="form-control">
              <?php foreach ($order_statuses as $order_status) { ?>
              <?php if ($order_status['order_status_id'] == $paymate_order_status_id) { ?>
              <option value="<?php echo $order_status['order_status_id']; ?>" selected="selected"><?php echo $order_status['name']; ?></option>
              <?php } else { ?>
              <option value="<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></option>
              <?php } ?>
              <?php } ?>
            </select>
          </div>
        </div>
        <div class="form-group">
          <label class="col-xs-2 control-label" for="input-geo-zone"><?php echo $entry_geo_zone; ?></label>
          <div class="col-xs-10">
            <select name="paymate_geo_zone_id" id="input-geo-zone" class="form-control">
              <option value="0"><?php echo $text_all_zones; ?></option>
              <?php foreach ($geo_zones as $geo_zone) { ?>
              <?php if ($geo_zone['geo_zone_id'] == $paymate_geo_zone_id) { ?>
              <option value="<?php echo $geo_zone['geo_zone_id']; ?>" selected="selected"><?php echo $geo_zone['name']; ?></option>
              <?php } else { ?>
              <option value="<?php echo $geo_zone['geo_zone_id']; ?>"><?php echo $geo_zone['name']; ?></option>
              <?php } ?>
              <?php } ?>
            </select>
          </div>
        </div>
        <div class="form-group">
          <label class="col-xs-2 control-label" for="input-status"><?php echo $entry_status; ?></label>
          <div class="col-xs-10">
                <div class="btn-group" data-toggle="buttons">
  			<label class="btn btn-primary<?php if ($paymate_status == 1) { ?> active<?php } ?>">
    				<i class="fa fa-check"></i> <input type="radio" name="paymate_status" id="input-status" <?php if ($paymate_status == 1) { ?>checked<?php } ?>> <?php echo $text_enabled; ?>
  			</label>
  			<label class="btn btn-primary<?php if ($paymate_status == 0) { ?> active<?php } ?>">
    				<i class="fa fa-times"></i> <input type="radio" name="paymate_status" id="input-status" <?php if ($paymate_status == 0) { ?>checked<?php } ?>> <?php echo $text_disabled; ?>
  			</label>
		</div>

          </div>
        </div>
        <div class="form-group">
          <label class="col-xs-2 control-label" for="input-sort-order"><?php echo $entry_sort_order; ?></label>
          <div class="col-xs-10">
            <input type="text" name="paymate_sort_order" value="<?php echo $paymate_sort_order; ?>" id="input-sort-order" class="form-control" />
          </div>
        </div>
      </form>
    </div>
  </div>
</div>
<?php echo $footer; ?> 