<div class="col-xs-12 hidden-sm hidden-xs" style="border:2px solid #F5F5F5; height:350px; padding:0; background-color:white; margin-top: 20px;" id="recommended-frame">
	<?php $varIndex = 0; ?>
	<div class="col-md-3 col-xs-4 hidden-sm hidden-xs" style="height:100%; padding:0; margin:0;">
		<div style="height:50%; border-bottom:1px solid #f8f8f8; border-right:2px solid #f8f8f8;">
			<div class="col-md-5 hidden-sm" style="width:35.7%;height:100%; background-image:url(./catalog/view/theme/golebar_theme/image/new-product.jpg); background-repeat:no-repeat;">
			</div>
			<div class="col-md-7" style="width:64.3%; height:100%; padding:0;">
				<?php if ($varIndex == 0) { ?>
					<div class="image" align="center" style="padding:0;">
						<a href="<?php echo $products[0]['href']; ?>" target="_blank">
							<img src="<?php echo $products[0]['thumb']; ?>" alt="<?php echo $products[0]['name']; ?>" title="<?php echo $products[0]['name']; ?>" class="img-responsive" height="110px" width="110px" style="margin-top:0px;" />
						</a>
						<div style="padding-top:0px; padding-left:15px; padding-right:15px;">
							<span style="font-size:12px; float:center;"><?php echo $products[0]['name']; ?></span>
							<span style="font-size:12px; float:center; color:#ff2a69;"> <?php echo $products[0]['price']; ?></span>
						</div>
					</div>
				<?php } ?>
			</div>
		</div>
		<div style="height:50%; border-right:2px solid #f8f8f8;">
			<div class="col-md-5" style="height:100%;">
				<div style="padding-top:45px; padding-left:0px; padding-right:5px; line-height:15px !important;">
					<p style="font-size:12px;"><?php echo $products[1]['name']; ?></p>
				</div>
				<div style="padding-left:0px; color:#ff2a69;">
					<p style="font-size:12px;"> <?php echo $products[1]['price']; ?></p>
				</div>
			</div>
			<div class="col-md-7" style="height:100%;">
				<div class="image" align="center" style="padding:0; position:absolute; bottom:5; right:10px;">
						<a href="<?php echo $products[1]['href']; ?>" target="_blank">
							<img src="<?php echo $products[1]['thumb']; ?>" alt="<?php echo $products[1]['name']; ?>" title="<?php echo $products[1]['name']; ?>" class="img-responsive" height="135px" width="135px" style="margin-top:20px;" />
						</a>
				</div>
			</div>
		</div>
	</div>
	<a href="<?php echo $image_link;?>"><div class="col-md-3 hidden-sm hidden-xs" style="height:100%; background-image:url(<?php echo $left2;?>); background-repeat:no-repeat; background-size: cover;">
	</div></a>
	<div class="col-md-3 col-sm-4 hidden-sm hidden-xs" style="height:100%; padding:0;">
		<div style="height:50%; border-bottom:1px solid #f8f8f8; border-right:2px solid #f8f8f8; border-left:2px solid #f8f8f8;">
			<div class="col-md-6" style="height:100%;">
				<div style="padding-top:50px; padding-left:15px; padding-right:5px; line-height:15px !important;">
					<p style="font-size:12px;"><?php echo $products[2]['name']; ?></p>
				</div>
				<div style="padding-left:15px; color:#ff2a69;">
					<p style="font-size:12px;"> <?php echo $products[2]['price']; ?></p>
				</div>
			</div>
			<div class="col-md-6" style="height:100%; ">
				<div class="image" align="center" style="padding:0;   position: relative; padding-top: 32%;">
						<a href="<?php echo $products[2]['href']; ?>" target="_blank">
							<img src="<?php echo $products[2]['thumb']; ?>" alt="<?php echo $products[2]['name']; ?>" title="<?php echo $products[2]['name']; ?>" class="img-responsive" height="160px" width="160px" />
						</a>
				</div>
			</div>
		</div>
		
		<div style="height:50%; border-right:2px solid #f8f8f8; border-left:2px solid #f8f8f8;">
			<div class="col-md-6" style="height:100%; border-right:1px solid #f8f8f8;">
				<div class="image" align="center" style="padding:0;">
					<a href="<?php echo $products[3]['href']; ?>" target="_blank">
						<img src="<?php echo $products[3]['thumb']; ?>" alt="<?php echo $products[3]['name']; ?>" title="<?php echo $products[3]['name']; ?>" class="img-responsive" height="110px" width="110px" style="margin-top:10px;" />
					</a>
					<div style="margin-top:5px; padding-left:5px; padding-right:5px;">
						<p style="font-size:12px; float:center; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;"><?php echo $products[3]['name']; ?><br><span style="font-size:12px; float:center; color:#ff2a69;"> <?php echo $products[3]['price']; ?></span></p>
						
					</div>
				</div>			
			</div>
			<div class="col-md-6" style="height:100%;">
				<div class="image" align="center" style="padding:0;">
					<a href="<?php echo $products[4]['href']; ?>" target="_blank">
						<img src="<?php echo $products[4]['thumb']; ?>" alt="<?php echo $products[4]['name']; ?>" title="<?php echo $products[4]['name']; ?>" class="img-responsive" height="110px" width="110px" style="margin-top:10px;" />
					</a>
					<div style="margin-top:5px; padding-left:5px; padding-right:5px;">
						<p style="font-size:12px; float:center; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;"><?php echo $products[4]['name']; ?><br><span style="font-size:12px; float:center; color:#ff2a69;"> <?php echo $products[4]['price']; ?></span></p>
					</div>
				</div>
			</div>	
		</div>
	</div>
	<div class="col-md-3 col-sm-4 hidden-sm hidden-xs" style="height:100%; padding:0;">
		<div style="height:50%; border-bottom:1px solid #f8f8f8;">
			<div class="col-md-6" style="height:100%;">
				<div style="padding-top:50px; padding-left:15px; padding-right:5px; line-height:15px !important;">
					<p style="font-size:12px;"><?php echo $products[5]['name']; ?></p>
				</div>
				<div style="padding-left:15px; color:#ff2a69;">
					<p style="font-size:12px;"> <?php echo $products[5]['price']; ?></p>
				</div>
			</div>
			<div class="col-md-6" style="height:100%;">
				<div class="image" align="center" style="padding:0; position: relative; padding-top:32%;">
						<a href="<?php echo $products[5]['href']; ?>" target="_blank">
							<img src="<?php echo $products[5]['thumb']; ?>" alt="<?php echo $products[5]['name']; ?>" title="<?php echo $products[5]['name']; ?>" class="img-responsive" height="160px" width="160px" />
						</a>
				</div>
			</div>
		</div>
		
		<div style="height:50%;">
			<div class="col-md-6" style="height:100%; border-right:1px solid #f8f8f8;">
				<div class="image" align="center" style="padding:0;">
					<a href="<?php echo $products[6]['href']; ?>" target="_blank">
						<img src="<?php echo $products[6]['thumb']; ?>" alt="<?php echo $products[6]['name']; ?>" title="<?php echo $products[6]['name']; ?>" class="img-responsive" height="110px" width="110px" style="margin-top:10px;" />
					</a>
					<div style="margin-top:5px; padding-left:5px; padding-right:5px;">
						<p style="font-size:12px; float:center; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;"><?php echo $products[6]['name']; ?><br><span style="font-size:12px; float:center; color:#ff2a69;"> <?php echo $products[6]['price']; ?></span></p>
					</div>
				</div>			
			</div>
			<div class="col-md-6" style="height:100%;">
				<div class="image" align="center" style="padding:0;">
					<a href="<?php echo $products[7]['href']; ?>" target="_blank">
						<img src="<?php echo $products[7]['thumb']; ?>" alt="<?php echo $products[7]['name']; ?>" title="<?php echo $products[7]['name']; ?>" class="img-responsive" height="110px" width="110px" style="margin-top:10px;" />
					</a>
					<div style="margin-top:5px; padding-left:5px; padding-right:5px;">
						<p style="font-size:12px; float:center; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;"><?php echo $products[7]['name']; ?><br><span style="font-size:12px; float:center; color:#ff2a69;"> <?php echo $products[7]['price']; ?></span></p>
					</div>
				</div>
			</div>	
		</div>
	</div>
</div>

<!-- Only for small -->
<div class="col-xs-12 hidden-lg hidden-md" style="padding:0; padding-top: 20px;">
	<span class="col-xs-12" style="height:18px; line-height: 18px; font-size: 16px; color:gray; padding: 0; border-left: 4px solid #2ecc71; padding-left: 8px; ">新品推荐</span>
	
	<div class="swiper-container hidden-lg hidden-md">
	    <div class="swiper-wrapper">
		    <?php foreach ($products as $product) { ?>
	        	<div class="swiper-slide">
	        		<div class="image" align="center" style="position: relative;">
						<a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" height="160px" width="160px" /></a>
					</div>
					<div style="position:absolute; background-color:Red; height:35px; width:100%; left:0; bottom:0; background-color:rgba(255,255,254,0.8);" align="center">
						<span class="col-xs-12" style="width:100%; font-size:12px; font-weight:400; line-height:17.5px; color:#303030; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;"><?php echo $product['name']; ?></span>
						<span class="col-xs-12" style="width:100%; color:#ff2a69; line-height:17.5px; font-size:12px;"><?php echo $product['price']; ?></span>
					</div>
	        	</div> 	
	        <?php } ?>
	    </div>
	</div>
</div>

<!-- Initialize Swiper -->
<script>
var swiper = new Swiper('.swiper-container', {
    pagination: '.swiper-scrollbar',
    slidesPerView: 3,
    paginationClickable: true,
    spaceBetween: 10
});
</script>
</script>

