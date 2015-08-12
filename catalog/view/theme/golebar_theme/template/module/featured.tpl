<div class="col-xs-12 hidden-sm hidden-xs" style="height:720px; padding:0; margin-top:25px; padding-bottom:20px; border-left:3px solid #f6b92d; border-right: 3px solid #5Ed7F0;">
	
	<div class="col-xs-12" style="height:270px; color:white; font-size: 26px; text-align: center;  background-image: url(http://golebar.com/image/catalog/sale_banner.jpg); background-repeat: no-repeat; background-size: cover; padding:0;">
	</div>
	<div style="position: absolute; top:18px; text-align: center; width: 100%; color: white; font-size: 26px;"><b>会员夏日$0.01特卖专区</b></div>
	<div class="col-md-12 col-sm-12 col-xs-12" style="height:400px; width:100%; padding:0;" id="special-sell-contents">
		<span class="col-sm-12 hidden-md hidden-lg col-xs-12" style="font-size: 17px; height: 34px; line-height: 34px; color: #ff2a69; border-left: 4px solid #ff2a69; border-bottom: 1px solid #f8f8f8;"><i class="fa fa-clock-o"></i> 夏日$0.01特卖专区</span>
		<?php foreach ($products as $product) { ?>
		<div class="col-md-3 col-sm-3 col-xs-3" style="background-color:white; height:200px; padding:0; background-color: white; border:1px solid #fafafa; ">
			<div class="image" align="center" style="position: relative; top:10%;">
			
			<?php if (!$product['special']) { ?> 
				<a href="http://golebar.com/index.php?route=account/login"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" height="160px" width="160px" /></a>
			<?php } else { ?>
				<a href="<?php echo $product['href']; ?>" target="_blank"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" height="160px" width="160px" /></a>
			<?php } ?>
				
			</div>
			<div style="position:absolute; bottom:0; height:40px; line-height:40px; width:100%; background-color:rgba(255,255,254,0.8);">
				<span class="hidden-xs" style="float:left; padding-left:10px; font-size:12px; font-weight:400; color:#303030; width: 78%; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;"><?php echo $product['name']; ?></span>
				<?php if (!$product['special']) { ?> 
					<span style="text-decoration: line-through; color:#2ecc71; font-size:13px; float:right; margin-right:10px;"><?php echo $product['price']; ?></span>
					<span style="color:#ff2a69; font-size:20px; font-weight:400; position:absolute; bottom:20px; right:10px;">
						<?php if ($logged) { ?>
							今日特卖完成
						<?php } else { ?>
							$0.01
						<?php } ?>
					</span>

				<?php } else { ?>
					
					<span style="text-decoration: line-through; color:#2ecc71; font-size:13px; float:right; margin-right:10px;"><?php echo $product['price']; ?></span>
					<span style="color:#ff2a69; font-size:20px; font-weight:100; position:absolute; bottom:20px; right:10px;"><?php echo $product['special']; ?></span>

				<?php } ?>
				
			
			</div>
		</div>
		<?php } ?>
	</div>
	
	<div class="col-xs-12" style="height:50px; color:white; font-size: 26px; text-align: center;  background-image: url(http://golebar.com/image/catalog/sale_banner.jpg); background-repeat: no-repeat; background-size: cover;">

	<div style="position: absolute; top:14px; text-align: center; width: 100%; color: white; font-size: 18px;">更换下一波$0.01商品倒计时： <b style="font-size: 26px;" id="counter"></b></div>
	</div>

</div>




<div class="col-xs-12 hidden-lg hidden-md" style="padding:0; margin-top:25px;">
	<span class="col-xs-12" style="height:18px; line-height: 18px; font-size: 16px; color:#ff2a69; padding: 0; border-left: 4px solid #ff2a69; padding-left: 8px;"> 夏日$0.01特卖专区</span>
	<div class="swiper-container hidden-lg hidden-md">
	    <div class="swiper-wrapper">
		    <?php foreach ($products as $product) { ?>
	        	<div class="swiper-slide">
	        		<div class="image" align="center" style="position: relative;">
						<a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" height="160px" width="160px" /></a>
					</div>
					<div style="position:absolute; background-color:Red; height:35px; width:100%; left:0; bottom:0; background-color:rgba(255,255,254,0.8);" align="center">
						<span class="col-xs-12" style="width:100%; line-height:17.5px; font-size:12px; font-weight:400; color:#303030; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;"><?php echo $product['name']; ?></span>
						<?php if (!$product['special']) { ?>
							<span style="color:#2ecc71; font-size:13px;"><?php echo $product['price']; ?></span>
							<span style="color:#ff2a69; font-size:14px; font-weight:600; position:absolute; bottom:0px; right:10px;">原价无秒杀</span>						<?php } else { ?>
							<span style="text-decoration: line-through; color:#2ecc71; font-size:13px;"><?php echo $product['price']; ?></span>
							<span style="color:#ff2a69; font-size:16px; font-weight:100; "><?php echo $product['special']; ?></span>
						<?php } ?>
					</div>
	        	</div> 	
	        <?php } ?>
	    </div>
	</div>
</div>

<!-- Initialize Swiper -->
<script>
	
	$( 'document' ).ready(function() {
		setInterval(function() {

			var a = new Date();
			var h = a.getHours();
			var m = a.getMinutes();
			var s = a.getSeconds();
			
			var left = 24*3600 - (h*3600+m*60+s);
			
			var newS = Math.floor(left%60);
			var newH = Math.floor((left/60)/60);
			var newM = Math.floor((left/60)%60);
			
			if (newS < 10) {
				newS = '' + 0 + newS;
			}
			
			if (newM < 10) {
				newM = '' + 0 + newM;
			}
			
			if (newH < 10) {
				newH = '' + 0 + newH;
			}
			
			$('#counter').text(newH + ":" + newM + ":" + newS);
			
		}, 1000);
	});
	
	function float2int (value) {
	    return value | 0;
	}
	
</script>
<script>
var swiper = new Swiper('.swiper-container', {
    pagination: '.swiper-scrollbar',
    slidesPerView: 3,
    paginationClickable: true,
    spaceBetween: 10
});
</script>
