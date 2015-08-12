<div class="row hidden-sm hidden-xs" style="padding: 0; margin: 0; height:614px; margin-bottom: 10px;">
	    <div style="height:614px; background-color: white;">
		    <div style="height:40px; background-color: #7e7f7e; color:white; line-height: 40px; font-size: 13px;" align="center">
		    	<i class="fa fa-thumbs-o-up" style="font-size:14px;"></i><span style="padding-left:5px;">热销产品推荐</span>
	    	</div>
	    	
		    <div style="height:574px; overflow-y: scroll;" class="hotproduct-cell">
			    <?php foreach ($products as $product) { ?>
				    <div style="height:115px;">
					    <div class="col-xs-1" style="padding:0; width:5%;"></div>
						
				    								<a href="<?php echo $product['href']; ?>">
					    
							    <div class="col-xs-3" style="border-bottom:1px solid #e4e4e4; padding:0; width:95%;">
								    <div class="col-xs-7" style="padding:0;">
							    		<div style="float:left; padding-top:35px; padding-left:5px; font-11px; font-weight:400; color:#303030; line-height:15px; padding-right:5px; color:#666666; font-size:12px; "> <?php echo $product['name']; ?></div>
							    		<div class="hidden-xs" style="float:center; padding-left:5px; color:#ff2a69; font-size:14px;" align="left"><?php echo $product['price']; ?></div>
			
							    	</div>
							    	<div class="col-xs-5" style="padding:0; height:115px;">
							    		<img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="" height="90px" width="90px" style="margin-top:12.5px; margin-left:5px;">
							    	</div>			 
							    </div>
						    </a>
				    </div>
			    <?php } ?>
		    </div>
	    </div>
</div>
