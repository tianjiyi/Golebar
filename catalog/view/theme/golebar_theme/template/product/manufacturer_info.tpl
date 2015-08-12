<?php echo $header; ?>
<div class="container">
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>
  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
      <h2><?php echo $heading_title; ?></h2>
      <?php if ($products) { ?>
      
      <div class="row">
        <div class="col-sm-3">
          <div class="btn-group hidden-xs">
            <button type="button" id="grid-view" class="btn btn-default hidden-xs hidden-sm hiddem-md hidden-lg" data-toggle="tooltip" title="<?php echo $button_grid; ?>"><i class="fa fa-th"></i></button>
          </div>
        </div>
        <div class="col-sm-1 col-sm-offset-2 text-right">
          <label class="control-label" for="input-sort"><?php echo $text_sort; ?></label>
        </div>
        <div class="col-sm-3 text-right">
          <select id="input-sort" class="form-control col-sm-3" onchange="location = this.value;">
            <?php foreach ($sorts as $sorts) { ?>
            <?php if ($sorts['value'] == $sort . '-' . $order) { ?>
            <option value="<?php echo $sorts['href']; ?>" selected="selected"><?php echo $sorts['text']; ?></option>
            <?php } else { ?>
            <option value="<?php echo $sorts['href']; ?>"><?php echo $sorts['text']; ?></option>
            <?php } ?>
            <?php } ?>
          </select>
        </div>
        <div class="col-sm-1 text-right">
          <label class="control-label" for="input-limit"><?php echo $text_limit; ?></label>
        </div>
        <div class="col-sm-2 text-right">
          <select id="input-limit" class="form-control" onchange="location = this.value;">
            <?php foreach ($limits as $limits) { ?>
            <?php if ($limits['value'] == $limit) { ?>
            <option value="<?php echo $limits['href']; ?>" selected="selected"><?php echo $limits['text']; ?></option>
            <?php } else { ?>
            <option value="<?php echo $limits['href']; ?>"><?php echo $limits['text']; ?></option>
            <?php } ?>
            <?php } ?>
          </select>
        </div>
      </div>
      <br />
      <div class="row">
        <?php foreach ($products as $product) { ?>
        <div class="product-layout product-list col-xs-12">
          <div class="product-thumb" style="max-height:330px; background-color:white; border:0;  overflow-y: hidden;">
            <div class="image" style="margin-top:10px;"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="" height="180px;" width="180px;" /></a></div>
            <div class="caption" style="line-height:14px; margin-top:25px;">
              <span style="font-size:12px;"><a href="<?php echo $product['href']; ?>" style="color:gray;"><?php echo $product['name']; ?></a></span><br>
              <?php if ($product['rating']) { ?>
              <div class="rating">
                <?php for ($i = 1; $i <= 5; $i++) { ?>
                <?php if ($product['rating'] < $i) { ?>
                <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span>
                <?php } else { ?>
                <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span>
                <?php } ?>
                <?php } ?>
              </div>
              <?php } ?>
              <?php if ($product['price']) { ?>
              <p class="price" style="color:#ff2a69; font-size:12px; padding-top:5px;">
                <?php if (!$product['special']) { ?>
                <?php echo $product['price']; ?>
                <?php } else { ?>
                <span class="price-new"><?php echo $product['special']; ?></span> <span class="price-old"><?php echo $product['price']; ?></span>
                <?php } ?>
              </p>
              <?php } ?>
            </div>
<div style="position:absolute; left:35px; bottom:35px;" class="hidden-xs">
			    	<input type="number" value="<?php echo $product['minimum']; ?>" style="max-width:40px; height:28px; border-radius:3px; border:1px solid #e4e4e4; text-align:center;" id="input_number_<?php echo $product['product_id']; ?>" min="1" class="input_number"></input>
			    </div>		  
			  
	          	<div style="position:absolute; right:30px; bottom:35px;" class="cate-xs">
	          		<input type="number" class="hidden-sm hiddem-md hidden-lg" value="<?php echo $product['minimum']; ?>" style="max-width:40px; height:28px; border-radius:3px; border:1px solid #e4e4e4; text-align:center;" id="input_number_<?php echo $product['product_id']; ?>" min="1" class="input_number"></input>
	          	 	<button style="min-width:20px; height:28px; background-color:#d0d1d2; border: 0px; color:white; border-radius:3px;" type="button" data-toggle="tooltip" title="<?php echo $button_wishlist; ?>" onclick="wishlist.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-heart fa-lg"></i></button>
			  	 	<button style="min-width:100px; height:28px; background-color:#ff2a69; border: 0px; color:white; border-radius:3px;" type="button" onclick="cateCartBtn(<?php echo $product['product_id']; ?>);"><span><?php echo $button_cart; ?></span></button>
				</div>
          </div>
        </div>
        <?php } ?>
      </div>
      <div class="row">
        <div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
        <div class="col-sm-6 text-right"><?php echo $results; ?></div>
      </div>
      <?php } else { ?>
      <p><?php echo $text_empty; ?></p>
      <div class="buttons">
        <div class="pull-right"><a href="<?php echo $continue; ?>" class="btn btn-primary"><?php echo $button_continue; ?></a></div>
      </div>
      <?php } ?>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>

<script type="text/javascript">
	function cateCartBtn(id) {
		cart.add(''+ id, '' + $( "#input_number_"+id ).val());
	}
	
	$('.input_number').on('change keyup', function() {
	  // Remove invalid characters
	  var sanitized = $(this).val().replace(/[^0-9]/g, '');
	  // Update value
	  $(this).val(sanitized);
	});
	
</script>

<?php echo $footer; ?>