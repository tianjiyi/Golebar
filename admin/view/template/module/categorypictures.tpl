<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" form="form-categorypictures" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
        <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a></div>
      <h1><?php echo $heading_title; ?></h1>
      <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
      </ul>
    </div>
  </div>
  <div class="container-fluid">
    <?php if ($error_warning) { ?>
    <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_edit; ?></h3>
      </div>
      <div class="panel-body">
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-categorypictures" class="form-horizontal">
          
		  	<div class="form-group col-xs-12">
            	<label class="col-sm-3 control-label" for="input-logo"><?php echo $entry_image1; ?></label>
				<div class="col-sm-9">
					<a href="" id="thumb-logo1" data-toggle="image" class="img-thumbnail"><img src="<?php echo $image1; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /></a>
                	<input type="hidden" name="categorypictures_image1" value="<?php echo $categorypictures_image1; ?>" id="input-logo1" />
                </div>
            </div>
            
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-categorypictures_image1title"><?php echo $entry_image1_title; ?></label>
            <div class="col-sm-10">
              <input type="text" name="categorypictures_image1title" value="<?php echo $categorypictures_image1title; ?>" placeholder="<?php echo $entry_image1_title; ?>" id="input-categorypictures_image1title" class="form-control" />
            </div>
          </div>
            
			<div class="form-group col-xs-12">
            	<label class="col-sm-3 control-label" for="input-logo"><?php echo $entry_image2; ?></label>
				<div class="col-sm-9">
					<a href="" id="thumb-logo2" data-toggle="image" class="img-thumbnail"><img src="<?php echo $image2; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /></a>
                	<input type="hidden" name="categorypictures_image2" value="<?php echo $categorypictures_image2; ?>" id="input-logo2" />
                </div>
            </div>
            
            <div class="form-group">
	            <label class="col-sm-2 control-label" for="input-categorypictures_image2title"><?php echo $entry_image2_title; ?></label>
	            <div class="col-sm-10">
	              <input type="text" name="categorypictures_image2title" value="<?php echo $categorypictures_image2title; ?>" placeholder="<?php echo $entry_image2_title; ?>" id="input-categorypictures_image2title" class="form-control" />
	            </div>
          	</div>
          	
			<div class="form-group col-xs-12">
            	<label class="col-sm-3 control-label" for="input-logo"><?php echo $entry_image3; ?></label>
				<div class="col-sm-9">
					<a href="" id="thumb-logo3" data-toggle="image" class="img-thumbnail"><img src="<?php echo $image3; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /></a>
                	<input type="hidden" name="categorypictures_image3" value="<?php echo $categorypictures_image3; ?>" id="input-logo3" />
                </div>
            </div>
            
            <div class="form-group">
	            <label class="col-sm-2 control-label" for="input-categorypictures_image3title"><?php echo $entry_image3_title; ?></label>
	            <div class="col-sm-10">
	              <input type="text" name="categorypictures_image3title" value="<?php echo $categorypictures_image3title; ?>" placeholder="<?php echo $entry_image3_title; ?>" id="input-categorypictures_image3title" class="form-control" />
	            </div>
          	</div>
            
			<div class="form-group col-xs-12">
            	<label class="col-sm-3 control-label" for="input-logo"><?php echo $entry_image4; ?></label>
				<div class="col-sm-9">
					<a href="" id="thumb-logo4" data-toggle="image" class="img-thumbnail"><img src="<?php echo $image4; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /></a>
                	<input type="hidden" name="categorypictures_image4" value="<?php echo $categorypictures_image4; ?>" id="input-logo4" />
                </div>
            </div>
            
            <div class="form-group">
	            <label class="col-sm-2 control-label" for="input-categorypictures_image4title"><?php echo $entry_image4_title; ?></label>
	            <div class="col-sm-10">
	              <input type="text" name="categorypictures_image4title" value="<?php echo $categorypictures_image4title; ?>" placeholder="<?php echo $entry_image4_title; ?>" id="input-categorypictures_image4title" class="form-control" />
	            </div>
          	</div>
            <div class="form-group col-xs-12">
	            <label class="col-xs-2 control-label" for="input-status"><?php echo $entry_status; ?></label>
				<div class="col-xs-10">
	              <select name="categorypictures_status" id="input-status" class="form-control">
	                <?php if ($categorypictures_status) { ?>
	                <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
	                <option value="0"><?php echo $text_disabled; ?></option>
	                <?php } else { ?>
	                <option value="1"><?php echo $text_enabled; ?></option>
	                <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
	                <?php } ?>
	              </select>
            	</div>
          	</div> 			     
        </form>
      </div>
	</div>
  </div>
</div>

<?php echo $footer; ?>