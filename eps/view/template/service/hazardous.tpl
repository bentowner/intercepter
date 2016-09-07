<div class=".col-lg-12 col-md-12 col-sm-6">
			<legend><?php echo $text_hazarditem; ?></legend>
			<div class=".col-lg-3 col-md-3 col-sm-3">
			<div class ="table-responsive">
				<div align="right"><a href="#haz" class="button">Add Hazardous</a></div>
		        <div class="pagination"><?php echo $pagination; ?><br></div>
		          <table class="table table-bordered">
		          
	            
	            <tr>
	             <td>  </td>
	            </tr>
	            <tr>
	              
	            </tr>         
	            </table>
            
            
        	</div><!--"booking-content" -->
            
        <div class ="hazardous-rates">
            <div class="booking-heading"><?php echo $text_hazardousrates; ?></div>
            <div class ="table-responsive">
          	<table class="table table-bordered">
            
            <tr><td class="required">Rates: <?php $rates_hazardous; ?> </td></tr>
            <tr><td class="required">Min:  &nbsp;&nbsp;&nbsp;&nbsp;$<?php $rates_hazardous_min; ?> </td></tr>         
             <tr><td class="required">Transship: $<?php echo $rates_hazsurcharge_tship; ?> </td></tr><tr>
            <td class="required">Transship Min:  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;$<?php echo $rates_hazsurcharge_tship_min; ?> </td>
            </tr> 
                        
            </table>
                        
            </div><!--"booking-content" -->
            </div><!-- end "hazardous-rates" -->
            
        </div><!-- end "hazardous-item" -->
        <div class=".col-lg-9 col-md-9 col-sm-9">
           


        <div class ="hazardous-detail">
            <div class="booking-heading"><?php echo $text_hazardousdetail; ?></div>
            <div class="booking-content">
            <div name="haz" id="haz">
          	<table class="box" border = "0" >
            
            <tr align = "center">
              <td><?php echo $entry_haz_imdg;?></td>
              <td><?php echo $entry_haz_un;?></td>
              <td><?php echo $entry_haz_group;?></td>
              <td><?php echo $entry_haz_flashpoint;?></td>
              <td><?php echo $entry_haz_units;?></td>
              <td><?php echo $entry_haz_psa;?></td>
              <td><?php echo $entry_haz_msds;?></td>
              <td><?php echo $entry_haz_ttype;?></td>
              <td>Proper "Shipping" Name</td>
              <td>Proper Technical "Label" Name</td>
              
            </tr>
            <tr>
               <td align = "center"><?php if (!empty($haz_imdg)){echo  $haz_imdg[$page-1]; } else {echo $haz_imdg;} ?></td>
               <td align = "center"><?php if (!empty($haz_un)){echo  $haz_un[$page-1];} else {echo $haz_un;} ?></td>
               <td align = "center"><?php if (!empty($haz_group)){echo  $haz_group[$page-1];} else {echo $haz_group;} ?></td>
               <td align = "center"><?php if (!empty($haz_flashpoint)){echo $haz_flashpoint[$page-1];} else {echo $haz_flashpoint;} ?></td>
               <td align = "center"><?php if (!empty($haz_units)){echo  $haz_units[$page-1];} else {echo $haz_units;} ?></td>
               <td align = "center"><?php if (!empty($haz_psa)){echo $haz_psa[$page-1]; } else {echo $haz_psa;} ?></td>
               <td align = "center"><?php if (!empty($haz_msds)){echo $haz_msds[$page-1]; } else {echo $haz_msds;} ?></td>
               <td align = "center"><?php if (!empty($haz_ttype)){echo $haz_ttype[$page-1]; } else {echo $haz_ttype;} ?></td>
              
               <td><?php if (!empty($haz_shippingname)){ ?> 															
               	 <input type="text" placeholder="" name="haz_shippingname" value="<?php echo $haz_shippingname[$page-1];?>" size ="50" />
               <?php } else { ?>
               <input type="text" placeholder="" name="haz_shippingname" value="<?php echo $haz_shippingname;?>" size ="50" /> </td>
               <?php } ?>  
               	
               <td><?php if (!empty($haz_techlabel)){ ?> 															
               	 <input type="text" placeholder="" name="haz_techlabel" value="<?php echo $haz_techlabel[$page-1];?>" size ="50" /></td>
               <?php } else { ?>
               <input type="text" placeholder="" name="haz_techlabel" value="<?php echo $haz_techlabel;?>" size ="50" /></td>
               <?php } ?>
               
               
            </tr>
            <tr>
	             <td><?php echo $entry_haz_ems;?></td>
	             <td></td>
	             <td><?php echo $entry_haz_doterg;?></td>
	             <td></td>
	             <td colspan = "4">Marine Pollutant <input type="checkbox" id="inlineCheckbox1"></td>
	          
	             
	             <td><?php if (!empty($haz_shippingname2)){ ?> 
	             <input type="text" placeholder="" name="haz_shippingname2" value="<?php echo $haz_shippingname2[$page-1];?>" size ="50" /></td>
	             <?php } else { ?>
	             <input type="text" placeholder="" name="haz_shippingname2" value="<?php echo $haz_shippingname2;?>" size ="50" /></td>
	             <?php } ?>  
	            
	             <td><?php if (!empty($haz_techlabel2)){ ?>
				 <input type="text" placeholder="" name="haz_techlabel2" value="<?php echo $haz_techlabel2[$page-1];?>" size ="50" /></td>
				  <?php } else { ?>
				 <input type="text" placeholder="" name="haz_techlabel2" value="<?php echo $haz_techlabel2;?>" size ="50" /></td>
				 <?php } ?> 
            </tr> 
             <tr  align ="top">
	             <td align = "center">F - <?php if (!empty($haz_f)){echo $haz_f[$page-1]; } else {echo $haz_f;} ?></td>
	             <td align = "center">S - <?php if (!empty($haz_s)){echo $haz_s[$page-1]; } else {echo $haz_s;} ?></td>
	             <td align = "center"><?php if (!empty($haz_doterg)){echo $haz_doterg[$page-1]; } else {echo $haz_doterg;} ?></td>
	             <td colspan = "2"></td>
	             	             
            	 <td> </td>
            	 
	             <td rowspan = "2" colspan = "2"><img src="view/image/marinepollutant.bmp" alt="" /></td>
	             
	             <td><?php if (!empty($haz_shippingname3)){ ?> 
	             <input type="text" placeholder="" name="haz_shippingname3" value="<?php echo $haz_shippingname3[$page-1];?>" size ="50" /></td>
	             <?php } else { ?>
	             <input type="text" placeholder="" name="haz_shippingname3" value="<?php echo $haz_shippingname3;?>" size ="50" /></td>
	             <?php } ?> 
	             	 
	             <td><?php if (!empty($haz_techlabel3)){ ?>
	             <input type="text" placeholder="" name="haz_techlabel3" value="<?php echo $haz_techlabel3[$page-1];?>" size ="50" /></td>
	             <?php } else { ?>
	             <input type="text" placeholder="" name="haz_techlabel3" value="<?php echo $haz_techlabel3;?>" size ="50" /></td>
	             <?php } ?> 
	        </tr>  
	        <tr>
	        <td colspan = "5" ><?php echo $entry_haz_24hourresponse;?></td>
             <td></td>
             <td><?php echo $entry_haz_acct;?></td>
             <td align = "right"><?php echo $entry_haz_erinfo;?></td>
             
            </tr>
            </table>
            <table>
             
            <tr>
                <td ><?php if (!empty($haz_24hourresponse)){ ?> 
	             <input type="text" placeholder="" name="haz_24hourresponse" value="<?php echo $haz_24hourresponse[$page-1];?>" size ="50" /></td>
	             <?php } else { ?>
	             <input type="text" placeholder="" name="haz_24hourresponse" value="<?php echo $haz_24hourresponse;?>" size ="50" /></td>
	             	 <?php } ?> 
             	<td ><?php if (!empty($haz_acct)){ ?> 
	             <input type="text" placeholder="" name="haz_acct" value="<?php echo $haz_acct[$page-1];?>" size ="50" /></td>
	             <?php } else { ?>
	             <input type="text" placeholder="" name="haz_acct" value="<?php echo $haz_acct;?>"  size ="80" /></td>
	             	 <?php } ?> 
	             	 
	            <td ><?php if (!empty($haz_erinfo)){ ?> 
	             <input type="text" placeholder="" name="haz_erinfo" value="<?php echo $haz_erinfo[$page-1];?>" size ="3" /></td>
	             <?php } else { ?>
	             <input type="text" placeholder="" name="haz_erinfo" value="<?php echo $haz_erinfo;?>"  size ="3" /></td>
	             	 <?php } ?> 
            </tr>  
			</table>
			
			<table>
				<tr>
				<td colspan = "2"><b>Booking</b></td>
				<td colspan = "2"><b>Hazardous</b></td>
				<td><b>Package Description</b></td>
				<td></td>
				
				</tr>
			
				<tr>
					<td align = "right">Haz Pcs Total</td>
					<td ><?php if (!empty($haz_pieces)){ ?> 
		             <input type="text" placeholder="" name="haz_pieces" value="<?php echo $haz_pieces[0];?>" size ="3" /></td>
		             <?php } else { ?>
		             <input type="text" placeholder="" name="haz_pieces" value="<?php echo $haz_pieces;?>"  size ="3" /></td>
		             	 <?php } ?> 
	             	 <td></td>
	             	 <td></td>
	             	 <td ><?php if (!empty($haz_description)){ ?> 
	                <input type="text" placeholder="" name="haz_description" value="<?php echo $haz_description[$page-1][$page-1];?>" size ="50" /></td>
	                 <?php } else { ?>
	                <input type="text" placeholder="" name="haz_description" value="<?php echo $haz_description;?>"  size ="50" /></td>
	             	 <?php } ?>
	             </tr>
	             
	             <tr>
	             	<td align = "right" >Booking Pcs Total</td>
					<td><input type="text" placeholder="<?php echo $entry_commodity_pieces;?>" name="commodity_pieces" value="<?php echo $commodity_pieces; ?>" size="10" /></td>
			    	<td></td>
					<td></td>
					<td ><?php if (!empty($haz_description)){ ?> 
	                <input type="text" placeholder="" name="haz_description" value="<?php echo $haz_description[$page][$page-1];?>" size ="50" /></td>
	                 <?php } else { ?>
	                <input type="text" placeholder="" name="haz_description" value="<?php echo $haz_description;?>"  size ="50" /></td>
	             	 <?php } ?>
				
				</tr>
			
				<tr>
			    	
			    	<td>&nbsp;<?php echo $entry_commodity_weight; ?></td>
			    	<td>&nbsp;<?php echo $entry_commodity_measure; ?></td>
			    	<td>&nbsp;<?php echo $entry_commodity_weight; ?></td>
			    	<td>&nbsp;<?php echo $entry_commodity_measure; ?></td>
					<td ><?php if (!empty($haz_description)){ ?> 
	                <input type="text" placeholder="" name="haz_description" value="<?php echo $haz_description[$page+1][$page-1];?>" size ="50" /></td>
	                 <?php } else { ?>
	                <input type="text" placeholder="" name="haz_description" value="<?php echo $haz_description;?>"  size ="50" /></td>
	             	 <?php } ?>
			    </tr>
			    	
			    <tr>
			    	<td><input type="text" placeholder="<?php echo $entry_commodity_lbs;?>" id="commodity_lbs" name="commodity_lbs" value="<?php echo $commodity_lbs; ?>" size="10" 
			    	onChange="if(document.getElementById('commodity_kg').value!=document.getElementById('commodity_lbs').value * 0.45359237) {UseNum=document.getElementById('commodity_lbs').value * 0.45359237;document.getElementById('commodity_kg').value=UseNum.toFixed(2)};" /></td>
			    	
			    	<td><input type="text" placeholder="<?php echo $entry_commodity_cft;?>" id="commodity_cft" name="commodity_cft" value="<?php echo $commodity_cft; ?>" size="10" 
					onchange="if (document.getElementById('commodity_cbm').value!=document.getElementById('commodity_cft').value * 0.0283168466) {UseNum=document.getElementById('commodity_cft').value * 0.0283168466 ;document.getElementById('commodity_cbm').value=UseNum.toFixed(2);};"/></td>
			    	
			    	<td ><?php if (!empty($haz_lbs)){ ?> 
	                <input type="text" placeholder="" name="haz_lbs" value="<?php echo $haz_lbs[$page-1];?>" size ="10" /></td>
	                 <?php } else { ?>
	                <input type="text" placeholder="" name="haz_lbs" value="<?php echo $haz_lbs;?>"  size ="3" /></td>
	             	 <?php } ?>
	             	 
	             	 <td ><?php if (!empty($haz_cft)){ ?> 
	                <input type="text" placeholder="" name="haz_cft" value="<?php echo $haz_cft[$page-1];?>" size ="10" /></td>
	                 <?php } else { ?>
	                <input type="text" placeholder="" name="haz_cft" value="<?php echo $haz_cft;?>"  size ="10" /></td>
	             	 <?php } ?>
			    
			    	
			    
			    
			    </tr>
			    <tr>
			    	
			    	<td><input type="text" placeholder="<?php echo $entry_commodity_kg;?>" id="commodity_kg" name="commodity_kg" value="<?php echo $commodity_kg; ?>" size="10" 
			    	onChange="if (document.getElementById('commodity_lbs').value!=document.getElementById('commodity_kg').value / 0.45359237) {UseNum=document.getElementById('commodity_kg').value / 0.45359237 ;document.getElementById('commodity_lbs').value=UseNum.toFixed(2);}" /></td>
			    	
			    	<td><input type="text" placeholder="<?php echo $entry_commodity_cbm;?>" id="commodity_cbm" name="commodity_cbm" value="<?php echo $commodity_cbm; ?>" size="10" 
					onchange="if (document.getElementById('commodity_cft').value!=document.getElementById('commodity_cbm').value / 0.0283168466) {UseNum=document.getElementById('commodity_cbm').value / 0.0283168466 ;document.getElementById('commodity_cft').value=UseNum.toFixed(2);};"/></td>
			    	
			    	<td ><?php if (!empty($haz_kg)){ ?> 
	                <input type="text" placeholder="" name="haz_kg" value="<?php echo $haz_kg[$page-1];?>" size ="10" /></td>
	                 <?php } else { ?>
	                <input type="text" placeholder="" name="haz_kg" value="<?php echo $haz_kg;?>"  size ="10" /></td>
	             	 <?php } ?>
	             	 
	             	 <td ><?php if (!empty($haz_cbm)){ ?> 
	                <input type="text" placeholder="" name="haz_cbm" value="<?php echo $haz_cbm[$page-1];?>" size ="10" /></td>
	                 <?php } else { ?>
	                <input type="text" placeholder="" name="haz_cbm" value="<?php echo $haz_cbm;?>"  size ="10" /></td>
	             	 <?php } ?>
			    </tr>
            </table>
         
            </div><!--"booking-content" -->
        </div><!-- end "hazardous-detail" -->
        </div>   
      </div><!-- end tab-->
      
</div>      