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
      <h1><?php echo $heading_title; ?></h1>
      <?php echo $text_message; ?>
      <div class="buttons">
        <div class="pull-right"><a href="<?php echo $continue; ?>" class="btn btn-primary"><?php echo $button_continue; ?></a></div>
      </div>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<script type="text/javascript">
$(document).ready(function() {
	/*
	alert( $.cookie("order") );
	alert( $.cookie("goodsprice") );
	alert( $.cookie("goodsmark") );
	alert( $.cookie("sig") );
	alert( $.cookie("trackid") );
	*/
	/*
	var order = $.cookie("order");
	var goodsprice = $.cookie("goodsprice");
	goodsprice = goodsprice.replace(/%7c/g, "|");
	var goodsmark = $.cookie("goodsmark");
	goodsmark = goodsmark.replace(/%7c/g, "|");
	var sig = $.cookie("sig");
	var trackid = $.cookie("trackid");
	
	
	$.post("http://www.linkhaitao.com/service/transfer.php?mod=create", { order: order, goodsprice: goodsprice, goodsmark: goodsmark, sig: sig, trackid: trackid  },
		function(data){
			alert("!!!");
			alert("linkhaitao: " + data);
   		});
   		
   	$.post("http://www.linkhaitao.com/service/transfer.php?mod=update", { order: $.cookie("order"), valid: 'true', sig: $.cookie("sigUpdate"), trackid: $.cookie("trackid")  },
		function(data){
			alert("linkhaitao: " + data);
   		});
   	*/
   	
});
</script>
<?php echo $footer; ?>

