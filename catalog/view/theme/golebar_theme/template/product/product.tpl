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
    <div id="content" class="col-md-9 col-xs-12" class="<?php echo $class; ?>"><?php echo $content_top; ?>
      <div class="row">
        <?php if ($column_left && $column_right) { ?>
        <?php $class = 'col-sm-6'; ?>
        <?php } elseif ($column_left || $column_right) { ?>
        <?php $class = 'col-sm-6'; ?>
        <?php } else { ?>
        <?php $class = 'col-sm-6'; ?>
        <?php } ?>
        <div class="<?php echo $class; ?>">
          <?php if ($thumb || $images) { ?>
          <ul class="thumbnails" >
            <?php if ($thumb) { ?>
            <li style="height:350px;"><a class="thumbnail" href="<?php echo $popup; ?>" title="<?php echo $heading_title; ?>"><img src="<?php echo $thumb; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" style="height:315px;" /></a></li>
            <?php } ?>
            <?php if ($images) { ?>
            <?php foreach ($images as $image) { ?>
            <li class="image-additional"><a class="thumbnail" href="<?php echo $image['popup']; ?>" title="<?php echo $heading_title; ?>"> <img src="<?php echo $image['thumb']; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" /></a></li>
            <?php } ?>
            <?php } ?>
          </ul>
          <?php } ?>     
         </div>
         
        <?php if ($column_left && $column_right) { ?>
        <?php $class = 'col-sm-6'; ?>
        <?php } elseif ($column_left || $column_right) { ?>
        <?php $class = 'col-sm-6'; ?>
        <?php } else { ?>
        <?php $class = 'col-sm-6'; ?>
        <?php } ?>
        <div class="<?php echo $class; ?>" style="padding-left: 40px;">

          <span style="font-size:22px; font-weight: 400;"><?php echo $heading_title; ?></span>
          
          <?php if ($price) { ?>
          <ul class="list-unstyled" style="padding:0; margin:0; padding-top:30px; line-height:25px;">
            <?php if (!$special) { ?>
            <li>
              <span style>价 格：&nbsp;<span style="color:#ff2a69; font-size:20px; font-weight:100;"><?php echo $price; ?></span></span>
            </li>
            <?php } else { ?>
            <li><span style="text-decoration: line-through;"><?php echo $price; ?></span></li>
            <li>
              <span style>价格: &nbsp;&nbsp;<span style="color:#ff2a69; font-size:20px; font-weight:100;"><?php echo $special; ?><span></span>
            </li>
            <?php } ?>
            <!--
            <?php if ($points) { ?>
            <li><?php echo $text_points; ?> <?php echo $points; ?></li>
            <?php } ?>
            -->
            <?php if ($discounts) { ?>
            <li>
              <hr>
            </li>
            <!--
            <?php foreach ($discounts as $discount) { ?>
            <li><?php echo $discount['quantity']; ?><?php echo $text_discount; ?><?php echo $discount['price']; ?></li>
            <?php } ?>
            -->
            <?php } ?>
          </ul>
          <?php } ?>
          
          <ul class="list-unstyled" style="line-height:25px;">
            <?php if ($manufacturer) { ?>
            <li><?php echo $text_manufacturer; ?> <a href="<?php echo $manufacturers; ?>" style="color:black; font-weight:600;"><?php echo $manufacturer; ?></a></li>
            <?php } ?>
            <?php if ($location) { ?>
            	<li>产 地： <?php echo $location; ?></li>
            <?php } ?>
            <?php if ($weight) { ?>
            	<li>净 含 量 ：<?php echo $model; ?></li>
            <?php } ?>
            <?php if ($reward) { ?>
            	<li><?php echo $text_reward; ?> <?php echo $reward; ?> <span style="padding-left:5px;" class="hint--right" data-hint="1购乐吧积分等同于$0.01现金抵用卷"><i class="fa fa-question-circle fa-1x" style="color:#ff2a69; font-size:14px;"></i></span></li>
            <?php } ?>
            
            <li><?php echo $text_stock; ?> <?php echo $stock; ?></li>
            
            <div class="rating">
	            
            	<p>评 分：
	              <?php for ($i = 1; $i <= 5; $i++) { ?>
	              <?php if ($rating < $i) { ?>
	              <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x " style="font-size:15px; "></i></span>
	              <?php } else { ?>
	              <span class="fa fa-stack"><i class="fa fa-star fa-stack-1x" style="font-size:15px;"></i><i class="fa fa-star-o fa-stack-1x"></i></span>
	              <?php } ?>
	              <?php } ?>
	              <a href="" onclick="$('a[href=\'#tab-review\']').trigger('click'); return false;" style="color:#ff2a69;"> <?php echo $reviews; ?></a>
              	</p>
            </div>
          </ul>
          <div id="product">
            
            <?php if ($recurrings) { ?>
            <hr>
            <h3><?php echo $text_payment_recurring ?></h3>
            <div class="form-group required">
              <select name="recurring_id" class="form-control">
                <option value=""><?php echo $text_select; ?></option>
                <?php foreach ($recurrings as $recurring) { ?>
                <option value="<?php echo $recurring['recurring_id'] ?>"><?php echo $recurring['name'] ?></option>
                <?php } ?>
              </select>
              <div class="help-block" id="recurring-description"></div>
            </div>
            <?php } ?>
            <div class="form-group">
	          <div class="col-xs-12" style="padding: 0; padding-bottom: 15px; line-height: 34px;">
              	<label style="width:15%; padding: 0;" class="control-label col-xs-2" for="input-quantity"><?php echo $entry_qty; ?></label>
			  	<input style="width:36%;" type="text" name="quantity" value="<?php echo $minimum; ?>" size="2" id="input-quantity" class="form-control col-xs-10" />
	          </div>
              <input type="hidden" name="product_id" value="<?php echo $product_id; ?>" />
              <br />
              
              <div class="form-group col-xs-8" style="padding:0; margin:0; padding-bottom: 20px;">
	            <div class="col-xs-9" style="padding:0; width：90%;">
              	<button style="height:34px; line-height: 17px;" type="button" id="button-cart" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-primary btn-lg btn-block" ><i class="fa fa-shopping-cart"></i> <?php echo $button_cart; ?></button>
	            </div>
	            <div class="col-xs-3" style="padding:0; width：10%;">
              		<button style="height:34px; line-height: 17px; border-style: none; float: right;" type="button" data-toggle="tooltip" class="btn btn-default" title="<?php echo $button_wishlist; ?>" onclick="wishlist.add('<?php echo $product_id; ?>');"><i class="fa fa-heart"></i></button>
	            </div>
              </div>
              <div class="col-xs-12"></div>
              
            </div>
            
          </div>
          <?php if ($review_status) { ?>
          <div class="rating">
            
            <hr>
            <!-- AddThis Button BEGIN -->
            <div class="addthis_toolbox addthis_default_style"><a class="addthis_button_facebook_like" fb:like:layout="button_count"></a> <a class="addthis_button_tweet"></a> <a class="addthis_button_pinterest_pinit"></a> <a class="addthis_counter addthis_pill_style"></a></div>
            <script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-515eeaf54693130e"></script>
            <!-- AddThis Button END -->
          </div>
          <?php } ?>
        </div>
      </div>
      <?php if ($products) { ?>
      <h3><?php echo $text_related; ?></h3>
      <div class="row">
        <?php $i = 0; ?>
        <?php foreach ($products as $product) { ?>
        <?php if ($column_left && $column_right) { ?>
        <?php $class = 'col-lg-6 col-md-6 col-sm-12 col-xs-12'; ?>
        <?php } elseif ($column_left || $column_right) { ?>
        <?php $class = 'col-lg-4 col-md-4 col-sm-6 col-xs-12'; ?>
        <?php } else { ?>
        <?php $class = 'col-lg-3 col-md-3 col-sm-6 col-xs-12'; ?>
        <?php } ?>
        <div class="<?php echo $class; ?>">
          <div class="product-thumb transition">
            <div class="image"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="" /></a></div>
            <div class="caption">
              <h4><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h4>
              <p><?php echo $product['description']; ?></p>
              <?php if ($product['rating']) { ?>
              <div class="rating">
                <?php for ($i = 1; $i <= 5; $i++) { ?>
                <?php if ($product['rating'] < $i) { ?>
                <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i></span>
                <?php } else { ?>
                <span class="fa fa-stack"><i class="fa fa-star fa-stack-1x"></i><i class="fa fa-star-o fa-stack-1x"></i></span>
                <?php } ?>
                <?php } ?>
              </div>
              <?php } ?>
              <?php if ($product['price']) { ?>
              <p class="price">
                <?php if (!$product['special']) { ?>
                <?php echo $product['price']; ?>
                <?php } else { ?>
                <span class="price-new"><?php echo $product['special']; ?></span> <span class="price-old"><?php echo $product['price']; ?></span>
                <?php } ?>
                <?php if ($product['tax']) { ?>
                <span class="price-tax"><?php echo $text_tax; ?> <?php echo $product['tax']; ?></span>
                <?php } ?>
              </p>
              <?php } ?>
            </div>
            <div class="button-group">
              <button type="button" onclick="cart.add('<?php echo $product['product_id']; ?>', '<?php echo $product['minimum']; ?>');"><span class="hidden-xs hidden-sm hidden-md"><?php echo $button_cart; ?></span> <i class="fa fa-shopping-cart"></i></button>
              <button type="button" data-toggle="tooltip" title="<?php echo $button_wishlist; ?>" onclick="wishlist.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-heart"></i></button>
              <button type="button" data-toggle="tooltip" title="<?php echo $button_compare; ?>" onclick="compare.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-exchange"></i></button>
            </div>
          </div>
        </div>
        <?php if (($column_left && $column_right) && ($i % 2 == 0)) { ?>
        <div class="clearfix visible-md visible-sm"></div>
        <?php } elseif (($column_left || $column_right) && ($i % 3 == 0)) { ?>
        <div class="clearfix visible-md"></div>
        <?php } elseif ($i % 4 == 0) { ?>
        <div class="clearfix visible-md"></div>
        <?php } ?>
        <?php $i++; ?>
        <?php } ?>
      </div>
      <?php } ?>
      <?php if ($tags) { ?>
      <p><?php echo $text_tags; ?>
        <?php for ($i = 0; $i < count($tags); $i++) { ?>
        <?php if ($i < (count($tags) - 1)) { ?>
        <a href="<?php echo $tags[$i]['href']; ?>"><?php echo $tags[$i]['tag']; ?></a>,
        <?php } else { ?>
        <a href="<?php echo $tags[$i]['href']; ?>"><?php echo $tags[$i]['tag']; ?></a>
        <?php } ?>
        <?php } ?>
      </p>
      <?php } ?>
      <div class="col-xs-12" style="height:auto; width: 100%; margin-top: 50px; padding: 0; background-color: white;">
	    <ul class="nav nav-tabs">
			  <li class="active"><a href="#tab-description" data-toggle="tab" style="color:gray;"><?php echo $tab_description; ?></a></li>
			  <?php if ($attribute_groups) { ?>
			  <li><a href="#tab-specification" data-toggle="tab" style="color:gray;"><?php echo $tab_attribute; ?></a></li>
			  <?php } ?>
			  <?php if ($review_status) { ?>
			  <li><a href="#tab-review" data-toggle="tab" style="color:gray;"><?php echo $tab_review; ?></a></li>
			  <?php } ?>
		</ul>


<div class="tab-content" style="padding:30px;">
   <div class="tab-pane active" id="tab-description"><?php echo $description; ?></div>
   <?php if ($attribute_groups) { ?>
   <div class="tab-pane" id="tab-specification">
     <table class="table table-bordered">
       <?php foreach ($attribute_groups as $attribute_group) { ?>
       <thead>
         <tr>
           <td colspan="2"><strong><?php echo $attribute_group['name']; ?></strong></td>
         </tr>
       </thead>
       <tbody>
         <?php foreach ($attribute_group['attribute'] as $attribute) { ?>
         <tr>
           <td><?php echo $attribute['name']; ?></td>
           <td><?php echo $attribute['text']; ?></td>
         </tr>
         <?php } ?>
       </tbody>
       <?php } ?>
     </table>
   </div>
   <?php } ?>
   <?php if ($review_status) { ?>
   <div class="tab-pane" id="tab-review">
     <form class="form-horizontal">
       <div id="review"></div>
       <?php if ($review_guest) { ?>
       <div class="form-group required">
         <div class="col-sm-12">
           <label class="control-label" for="input-name"><?php echo $entry_name; ?></label>
           <input type="text" name="name" value="" id="input-name" class="form-control" />
         </div>
       </div>
       <div class="form-group required">
         <div class="col-sm-12">
           <label class="control-label" for="input-review"><?php echo $entry_review; ?></label>
           <textarea name="text" rows="5" id="input-review" class="form-control"></textarea>
           <div class="help-block"><?php echo $text_note; ?></div>
         </div>
       </div>
       <div class="form-group required">
         <div class="col-sm-12">
           <label class="control-label"><?php echo $entry_rating; ?></label>
           &nbsp;&nbsp;&nbsp; <?php echo $entry_bad; ?>&nbsp;
           <input type="radio" name="rating" value="1" />
           &nbsp;
           <input type="radio" name="rating" value="2" />
           &nbsp;
           <input type="radio" name="rating" value="3" />
           &nbsp;
           <input type="radio" name="rating" value="4" />
           &nbsp;
           <input type="radio" name="rating" value="5" />
           &nbsp;<?php echo $entry_good; ?></div>
       </div>
       <?php if ($site_key) { ?>
         <div class="form-group">
           <div class="col-sm-12">
             <div class="g-recaptcha" data-sitekey="<?php echo $site_key; ?>"></div>
           </div>
         </div>
       <?php } ?>
       <div class="buttons clearfix">
         <div class="pull-right">
           <button type="button" id="button-review" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-primary"><?php echo $button_continue; ?></button>
         </div>
       </div>
       <?php } else { ?>
       <?php echo $text_login; ?>
       <?php } ?>
     </form>
   </div>
   <?php } ?>
 </div>
      </div>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?>    
    
    </div>
</div>


<script type="text/javascript"><!--
$('select[name=\'recurring_id\'], input[name="quantity"]').change(function(){
	$.ajax({
		url: 'index.php?route=product/product/getRecurringDescription',
		type: 'post',
		data: $('input[name=\'product_id\'], input[name=\'quantity\'], select[name=\'recurring_id\']'),
		dataType: 'json',
		beforeSend: function() {
			$('#recurring-description').html('');
		},
		success: function(json) {
			$('.alert, .text-danger').remove();

			if (json['success']) {
				$('#recurring-description').html(json['success']);
			}
		}
	});
});
//--></script>
<script type="text/javascript"><!--
$('#button-cart').on('click', function() {
	$.ajax({
		url: 'index.php?route=checkout/cart/add',
		type: 'post',
		data: $('#product input[type=\'text\'], #product input[type=\'hidden\'], #product input[type=\'radio\']:checked, #product input[type=\'checkbox\']:checked, #product select, #product textarea'),
		dataType: 'json',
		beforeSend: function() {
			$('#button-cart').button('loading');
		},
		complete: function() {
			$('#button-cart').button('reset');
		},
		success: function(json) {
			$('.alert, .text-danger').remove();
			$('.form-group').removeClass('has-error');

			if (json['error']) {
				if (json['error']['option']) {
					for (i in json['error']['option']) {
						var element = $('#input-option' + i.replace('_', '-'));

						if (element.parent().hasClass('input-group')) {
							element.parent().after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
						} else {
							element.after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
						}
					}
				}

				if (json['error']['recurring']) {
					$('select[name=\'recurring_id\']').after('<div class="text-danger">' + json['error']['recurring'] + '</div>');
				}

				// Highlight any found errors
				$('.text-danger').parent().addClass('has-error');
			}

			if (json['success']) {
				$('.breadcrumb').after('<div class="alert alert-success">' + json['success'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');

				$('#cart > button').html('<i class="fa fa-shopping-cart"></i> ' + json['total']);

				$('html, body').animate({ scrollTop: 0 }, 'slow');

				$('#cart > ul').load('index.php?route=common/cart/info ul li');
			}
		}
	});
});
//--></script>
<script type="text/javascript"><!--
$('.date').datetimepicker({
	pickTime: false
});

$('.datetime').datetimepicker({
	pickDate: true,
	pickTime: true
});

$('.time').datetimepicker({
	pickDate: false
});

$('button[id^=\'button-upload\']').on('click', function() {
	var node = this;

	$('#form-upload').remove();

	$('body').prepend('<form enctype="multipart/form-data" id="form-upload" style="display: none;"><input type="file" name="file" /></form>');

	$('#form-upload input[name=\'file\']').trigger('click');

	if (typeof timer != 'undefined') {
    	clearInterval(timer);
	}

	timer = setInterval(function() {
		if ($('#form-upload input[name=\'file\']').val() != '') {
			clearInterval(timer);

			$.ajax({
				url: 'index.php?route=tool/upload',
				type: 'post',
				dataType: 'json',
				data: new FormData($('#form-upload')[0]),
				cache: false,
				contentType: false,
				processData: false,
				beforeSend: function() {
					$(node).button('loading');
				},
				complete: function() {
					$(node).button('reset');
				},
				success: function(json) {
					$('.text-danger').remove();

					if (json['error']) {
						$(node).parent().find('input').after('<div class="text-danger">' + json['error'] + '</div>');
					}

					if (json['success']) {
						alert(json['success']);

						$(node).parent().find('input').attr('value', json['code']);
					}
				},
				error: function(xhr, ajaxOptions, thrownError) {
					alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
				}
			});
		}
	}, 500);
});
//--></script>
<script type="text/javascript"><!--
$('#review').delegate('.pagination a', 'click', function(e) {
  e.preventDefault();

    $('#review').fadeOut('slow');

    $('#review').load(this.href);

    $('#review').fadeIn('slow');
});

$('#review').load('index.php?route=product/product/review&product_id=<?php echo $product_id; ?>');

$('#button-review').on('click', function() {
	$.ajax({
		url: 'index.php?route=product/product/write&product_id=<?php echo $product_id; ?>',
		type: 'post',
		dataType: 'json',
		data: 'name=' + encodeURIComponent($('input[name=\'name\']').val()) + '&text=' + encodeURIComponent($('textarea[name=\'text\']').val()) + '&rating=' + encodeURIComponent($('input[name=\'rating\']:checked').val() ? $('input[name=\'rating\']:checked').val() : ''),
		beforeSend: function() {
			$('#button-review').button('loading');
		},
		complete: function() {
			$('#button-review').button('reset');
		},
		success: function(json) {
			$('.alert-success, .alert-danger').remove();

			if (json['error']) {
				$('#review').after('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '</div>');
			}

			if (json['success']) {
				$('#review').after('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');

				$('input[name=\'name\']').val('');
				$('textarea[name=\'text\']').val('');
				$('input[name=\'rating\']:checked').prop('checked', false);
			}
		}
	});
});

$(document).ready(function() {
	$('.thumbnails').magnificPopup({
		type:'image',
		delegate: 'a',
		gallery: {
			enabled:true
		}
	});
});
//--></script>
<?php echo $footer; ?>