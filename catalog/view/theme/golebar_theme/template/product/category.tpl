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
      <p style="font-size: 16px;"><b><?php echo $heading_title; ?></b></p>
      
      <?php if ($categories) { ?>
      <h3><?php echo $text_refine; ?></h3>
      <?php if (count($categories) <= 5) { ?>
      
      <div class="row">
        <div class="col-sm-2">
          <ul>
            <?php foreach ($categories as $category) { ?>
            <?php $ptitle = explode('(', $category['name']); ?>
            <li><a href="<?php echo $category['href']; ?>"><?php echo $ptitle[0]; ?></a></li>
            <?php } ?>
          </ul>
        </div>
      </div>
      <?php } else { ?>
      <div class="row">
        <?php foreach (array_chunk($categories, ceil(count($categories) / 4)) as $categories) { ?>
        <div class="col-sm-3">
          <ul>
            <?php foreach ($categories as $category) { ?>
            <li><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a></li>
            <?php } ?>
          </ul>
        </div>
        <?php } ?>
      </div>
      <?php } ?>
      <?php } ?>
      <?php if ($products) { ?>
      
      <div class="row" style="background-color:white; padding:0; margin:0; height:44px;" id="product-list-top">
        <div class="col-md-4 col-xs-12" style="margin-top:9px;" >
          <div class="btn-group">
			<button id="grid-view" data-toggle="tooltip" title="<?php echo $button_grid; ?>" style="height:26px;  width:auto; font-size:12px; background-color:white; border:1px solid lightgray; color:gray;"><i class="fa fa-th fa-lg"></i> 大图显示 </button>
			<button id="list-view" data-toggle="tooltip" title="<?php echo $button_list; ?>" style="height:26px;  width:auto; font-size:12px; background-color:white; border:1px solid lightgray; color:gray;"><i class="fa fa-th-list fa-lg"></i> 列表显示 </button>
          </div>
        </div>
        <div class="col-md-5" style=" padding:0; margin-top:9px;">
	        <div class="col-md-4" style="line-height:26px;">
	          <label class="control-label" for="input-sort"><?php echo $text_sort; ?></label>
	        </div>
	        <div class="col-md-8">
	          <select id="input-sort" class="form-control" onchange="location = this.value;" style=" height:26px; border:1px solid lightgray;">
	            <?php foreach ($sorts as $sorts) { ?>
	            <?php if ($sorts['value'] == $sort . '-' . $order) { ?>
	            <option value="<?php echo $sorts['href']; ?>" selected="selected"><?php echo $sorts['text']; ?></option>
	            <?php } else { ?>
	            <option value="<?php echo $sorts['href']; ?>"><?php echo $sorts['text']; ?></option>
	            <?php } ?>
	            <?php } ?>
	          </select>
	        </div>
        </div>
        <div class="col-md-3" style="margin-top:9px;">
	        <div class="col-md-5 text-right hidden-xs hidden-sm hidden-md" >
	          <label class="control-label" for="input-limit"><?php echo $text_limit; ?></label>
	        </div>
	        <div class="col-lg-7 col-md-12 text-right hidden-xs hidden-sm">
	          <select id="input-limit" class="form-control" onchange="location = this.value;" style="height:26px; border:1px solid lightgray;">
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
		</div>
      
    
	<div class="row" style="margin-top:10px;">
	  <?php foreach ($products as $product) { ?>
	  <div class="product-layout product-list col-xs-12"  style="background-color:#fafafa; ">
	    <div class="product-thumb" style="max-height:330px; background-color:white; border:0;  overflow-y: hidden;">
	      <div class="image" style="margin-top:10px;"><a href="<?php echo $product['href']; ?>" target="_blank"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" height="180px;" width="180px;" /></a></div>
	      <div>
	        <div class="caption" style="line-height:14px; margin-top:25px;">
	        	<?php if ($product['price']) { ?>
			          <p class="price">
			            <?php if (!$product['special']) { ?>
			            <span style="font-size:14px; font-weight:400; color:#ff2a69;"><?php echo $product['price']; ?></span>
			            <?php } else { ?>
			            <span class="price-new" style="font-size:14px; font-weight:400; color:#ff2a69;"><?php echo $product['special']; ?></span> <span class="price-old"><?php echo $product['price']; ?></span>
			            <?php } ?>
			          </p>
				<?php } ?>
	        
	        
	          <span><a href="<?php echo $product['href']; ?>" style="font-size:12px; color:#666666;"><?php echo $product['name']; ?></a></span>
	          
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
			    <div style="position:absolute; left:35px; bottom:35px;" class="hidden-xs">
			    	<input type="number" value="<?php echo $product['minimum']; ?>" style="max-width:40px; height:28px; border-radius:3px; border:1px solid #e4e4e4; text-align:center;" id="input_number_<?php echo $product['product_id']; ?>" min="1" class="input_number hidden-xs"></input>
			    </div>		  
			  
	          	<div style="position:absolute; right:30px; bottom:35px;" class="cate-xs">
	          		<input type="number" class="hidden-sm hidden-md hidden-lg" value="<?php echo $product['minimum']; ?>" style="max-width:40px; height:28px; border-radius:3px; border:1px solid #e4e4e4; text-align:center;" id="input_number_<?php echo $product['product_id']; ?>" min="1" class="input_number"></input>
	          	 	<button style="min-width:20px; height:28px; background-color:#d0d1d2; border: 0px; color:white; border-radius:3px;" type="button" data-toggle="tooltip" title="<?php echo $button_wishlist; ?>" onclick="wishlist.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-heart fa-lg"></i></button>
			  	 	<button style="min-width:100px; height:28px; background-color:#ff2a69; border: 0px; color:white; border-radius:3px;" type="button" onclick="cateCartBtn(<?php echo $product['product_id']; ?>);"><span><?php echo $button_cart; ?></span></button>
				</div>
				
	        </div>       
	      </div>
	    </div>
	  </div>
	  <?php } ?>
	</div>
	
      <div class="row">
        <div class="col-sm-4 text-left"><?php echo $results; ?></div>
        <div class="col-sm-8 text-right"><?php echo $pagination; ?></div>
      </div>
      <?php } ?>
      <?php if (!$categories && !$products) { ?>
      <p><?php echo $text_empty; ?></p>
      <div class="buttons">
        <div class="pull-right"><a href="<?php echo $continue; ?>" class="btn btn-primary"><?php echo $button_continue; ?></a></div>
      </div>
      <?php } ?>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?>

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
