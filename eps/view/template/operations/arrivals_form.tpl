<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
       <a type="button" data-toggle="tooltip" title="<?php echo $button_add; ?>"  href="<?php echo $add_new; ?>" class="btn btn-primary"><i class="fa fa-plus"></i></a>
       <a type="button" id="button_arrival_view" data-toggle="tooltip" title="<?php echo $button_arrival_view; ?>"  href="<?php echo $arrivalsearch; ?>" class="btn btn-info"><i class="fa fa-cubes"></i></a>
       <a type="button" id="button-save" href="<?php echo $save; ?>"  class="btn btn-primary"><i class="fa fa-check-circle"></i> <?php echo $button_save; ?></a>
       <a href="<?php echo $cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i> <?php echo $button_cancel; ?></a>
      
      </div>
      <h1><?php echo $heading_title; ?></h1>
      <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>	
      </ul>
      <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_form; ?></h3>
      </div>  
       <div class="panel-body">
		 <form class="form"  id='arrivalID' role="form" method="post" action="<?php echo $action; ?>">
		 
        
      	 <div class="row">
      	  <div class=".col-lg-3 col-md-3 col-sm-6"><!--Warehouse details -->
      	  
      	  	<div class="row">
      	  		<div class="form-group">
      	  		 <div class=".col-lg-3 col-md-3 col-sm-6">
      	  		    <div class="input-group">
	                    <?php echo $entry_receipt_warehouse; ?>
	               	</div>
	             </div>
		         <div class=".col-lg-9 col-md-9 col-sm-6">
      	  		 	<input type="text" placeholder="" name="receipt_warehouse" value="<?php echo $receipt_warehouse; ?>" class="form-control" />
      	  		 </div>
      	  		</div> 		 
  			 </div> <!-- End of row -->
  			 
  			 <div class="row">
  			    <div class="form-group">
      	  		 <div class=".col-lg-3 col-md-3 col-sm-6">
      	  	        <div class="input-group">
	                   <?php echo $entry_receipt_receipt; ?>
	                </div>
		           </div>
      	  		    <div class=".col-lg-9 col-md-9 col-sm-6">
      	  		 	<input type="text" placeholder="" name="receipt_receipt" value="<?php echo $receipt_receipt; ?>" class="form-control" />
      	  		    </div>
      	  		 </div>
      	  		 
  			 </div> <!-- End of row -->
  			  <legend></legend>
  			<div class="row"> 
  			
  		
	         
  			 <div class="form-group date required col-sm-6">
	            <label class=" control-label" for="receipt_date"><?php echo $entry_receipt_date; ?></label>
	                <div id="receipt_date" class="input-group date">
	    			<input type="text" name="receipt_date" value="<?php echo $receipt_date; ?>"  data-date-format="YYYY-MM-DD" class="form-control" />
	                  
	                  <span class="input-group-btn">
	                  <button type="button" class="btn btn-primary"><i class="fa fa-calendar"></i></button>
	                  </span>
	                </div>
	         </div>
	         
	         <div class="form-group col-sm-6">
	            <label class=" control-label" for="receipt_date_out"><?php echo $entry_receipt_date_out; ?></label>
	                <div id="receipt_date_out" class="input-group date">
	    			<input type="text" name="receipt_date_out" value="<?php echo $receipt_date_out; ?>"  data-date-format="YYYY-MM-DD" class="form-control" />
	                  
	                  <span class="input-group-btn">
	                  <button type="button" class="btn btn-primary"><i class="fa fa-calendar"></i></button>
	                  </span>
	                </div>
	         </div>
  			  </div> <!-- End of row -->
  			 <div class="row">
  			    <div class="form-group">
      	  		 <div class=".col-lg-3 col-md-3 col-sm-6">
      	  	        <div class="input-group">
	                   <?php echo $entry_receipt_cfs; ?>
	                </div>
		           </div>
      	  		    <div class=".col-lg-3 col-md-3 col-sm-6">
      	  		 	<input type="text" placeholder="" name="entry_receipt_cfs" value="<?php echo $receipt_cfs; ?>" class="form-control" />
      	  		    </div>
      	  		    <div class=".col-lg-3 col-md-3 col-sm-6 pull-right">Days
      	  		    </div>
      	  		    <div class=".col-lg-3 col-md-3 col-sm-6 ">
      	  		 	<input type="text" placeholder="" name="entry_receipt_cfs" value="<?php echo $receipt_days; ?>" class="form-control" />
      	  		    </div>
      	  		 </div>
      	  		 
  			 </div> <!-- End of row -->
  			
  			 
  			  <div class="row">
  			    <div class="form-group">
      	  		 <div class=".col-lg-3 col-md-3 col-sm-6">
      	  	        <div class="input-group">
	                  <?php echo $entry_receipt_section; ?>
	                  
	                </div>
		           </div>
      	  		    <div class=".col-lg-9 col-md-9 col-sm-6">
      	  		 	<input type="text" placeholder="" name="entry_receipt_section" value="<?php echo $receipt_section ; ?>" class="form-control" />
      	  		    </div>
      	  		 </div>
      	  		 
  			 </div> <!-- End of row -->
  			 
  			  <div class="row">
  			    <div class="form-group">
      	  		 <div class=".col-lg-3 col-md-3 col-sm-6">
      	  	        <div class="input-group">
	                 <?php echo $entry_arrival_accountemail; ?>
	                 <span class="input-group-btn pull-right">
	                 <input type="checkbox" id="email_accountemail" value="<?php echo $email_accountemail; ?>"><?php echo $arrival_accountemail; ?>
	                  </span>
	                </div>
		           </div>
      	  		    <div class=".col-lg-9 col-md-9 col-sm-6">
      	  		 	<input type="text" placeholder="Email Address" name="arrival_accountemail" value="<?php echo $arrival_accountemail; ?>" class="form-control" />
      	  		 	
      	  		    </div>
      	  		 </div>
      	  		 
  			 </div> <!-- End of row -->
  			 
  			 <div class="row">
  			    <div class="form-group">
      	  		 <div class=".col-lg-3 col-md-3 col-sm-6">
      	  	        <div class="input-group">
	                <?php echo $entry_arrival_accountfax; ?>
	                 <span class="input-group-btn pull-right">
	                 <input type="checkbox" id="arrival_accountemail" value="<?php echo $arrival_accountemail; ?>"><?php echo $arrival_accountemail; ?>
	                  </span>
	                </div>
		           </div>
      	  		    <div class=".col-lg-9 col-md-9 col-sm-6">
      	  		 	<input type="text" placeholder="Fax number" name="arrival_accountfax" value="<?php echo $arrival_accountfax; ?>" class="form-control" />
      	  		 	
      	  		    </div>
      	  		 </div>
      	  		 
  			 </div> <!-- End of row -->
  			 
           </div><!-- End of Warehouse details -->
      	  
      	   <div class=".col-lg-4 col-md-4 col-sm-6">
      	   
	     	<div class="row">
      	  		<div class="form-group">
      	  		 <div class=".col-lg-4 col-md-4 col-sm-6">
      	  		 <?php echo $entry_arrival_receivedfrom; ?>
      	  		 </div>
      	  		 <div class=".col-lg-8 col-md-8 col-sm-6">
      	  		 	<input type="text" placeholder="" name="arrival_receivedfrom" value="<?php echo $arrival_receivedfrom; ?>" class="form-control" />
      	  	     </div>
      	  		    
      	  		</div>
      	  	</div>	<!-- End of row -->
      	  	
      	  	<div class="row">
      	  		<div class="form-group">
      	  		 <div class=".col-lg-4 col-md-4 col-sm-6">
      	  		<?php echo $entry_arrival_via; ?>
      	  		 </div>
      	  		 <div class=".col-lg-8 col-md-8 col-sm-6">
      	  		 	<input type="text" placeholder="" name="arrival_via" value="<?php echo $arrival_via; ?>" class="form-control" />
      	  	     </div>
      	  		    
      	  		</div>
      	  	</div>	<!-- End of row -->
      	  	
      	  	<div class="row">
      	  		<div class="form-group">
      	  		 <div class=".col-lg-4 col-md-4 col-sm-6">
      	  		<?php echo $entry_arrival_po; ?>
      	  		 </div>
      	  		 <div class=".col-lg-8 col-md-8 col-sm-6">
      	  		 	<input type="text" placeholder="" name="arrival_po" value="<?php echo $arrival_po; ?>" class="form-control" />
      	  	     </div>
      	  		    
      	  		</div>
      	  	</div>	<!-- End of row -->
      	  	
   	  		<div class="row">
   	  		<div class="form-group">
    	  		 <div class=".col-lg-4 col-md-4 col-sm-6">
    	  		<?php echo $entry_arrival_consignee; ?>
    	  		 </div>
    	  		 <div class=".col-lg-8 col-md-8 col-sm-6">
    	  		 	<input type="text" placeholder="" name="arrival_consignee" value="<?php echo $arrival_consignee; ?>" class="form-control" />
    	  	     </div>
    	  		    
      	  		</div>
      	  	</div>	<!-- End of row -->
      	  	
      	  	<div class="row">
   	  		<div class="form-group">
    	  		 <div class=".col-lg-4 col-md-4 col-sm-6">
    	  		<?php echo $entry_arrival_booking; ?>
    	  		 </div>
    	  		 <div class=".col-lg-8 col-md-8 col-sm-6">
    	  		 	<input type="text" placeholder="" name="arrival_booking" value="<?php echo $arrival_booking; ?>" class="form-control" />
    	  	     </div>
    	  		    
      	  		</div>
      	  	</div>	<!-- End of row -->
      	  	
      	  	<div class="row">
   	  		<div class="form-group">
    	  		 <div class=".col-lg-4 col-md-4 col-sm-6">
    	  		<?php echo $entry_arrival_attention; ?>
    	  		 </div>
    	  		 <div class=".col-lg-8 col-md-8 col-sm-6">
    	  		 	<input type="text" placeholder="" name="arrival_attention" value="<?php echo $arrival_attention; ?>" class="form-control" />
    	  	     </div>
    	  		    
      	  		</div>
      	  	</div>	<!-- End of row -->
      	  	
      	  
      	  	<div class="row">
   	  		<div class="form-group">
    	  		 <div class=".col-lg-4 col-md-4 col-sm-6">
    	  			<?php echo $entry_arrival_remarks; ?>
    	  		 </div>
    	  		 <div class=".col-lg-8 col-md-8 col-sm-6">
    	  		 	<input type="text" placeholder="" name="arrival_remarks" value="<?php echo $arrival_remarks; ?>" class="form-control" />
    	  	     </div>
    	  		    
      	  		</div>
      	  	</div>	<!-- End of row -->
      	  	<div class="row">
   	  		<div class="form-group">
    	  		 <div class=".col-lg-4 col-md-4 col-sm-6">
    	  				<?php echo $entry_arrival_destination; ?>
    	  		 </div>
    	  		 <div class=".col-lg-8 col-md-8 col-sm-6">
    	  		 	<input type="text" placeholder="" name="arrival_destination" value="<?php echo $arrival_destination; ?>" class="form-control" />
    	  	     </div>
    	  		    
      	  		</div>
      	  	</div>	<!-- End of row -->
      	  	<div class="row">
   	  		<div class="form-group">
    	  		 <div class=".col-lg-4 col-md-4 col-sm-6">
    	  			<?php echo $entry_arrival_transferfrom; ?> 
    	  		 </div>
    	  		 <div class=".col-lg-8 col-md-8 col-sm-6">
    	  		 	<input type="text" placeholder="" name="arrival_transferfrom" value="<?php echo $arrival_transferfrom; ?>" class="form-control" />
    	  	     </div>
    	  		    
      	  		</div>
      	  	</div>	<!-- End of row -->
      	   </div>
	      
	      
	      <div class=".col-lg-5 col-md-5 col-sm-6">
	      
	      <div class="row">
	      <div class=".col-lg-10 col-md-10 col-sm-6">
	      <table id ="package" class="table table-striped table-bordered table-hover">
	      <thead>
      			<tr>
      			<td><?php echo $entry_arrival_pkgs; ?> </td><td><?php echo $entry_arrival_packagetype; ?>  </td>
      			</tr>
      			</thead>
			            <tbody>
			            <?php $package_row = 0; ?>
			            <?php foreach ($packages as $package) { ?>
      			<tr id="package-row<?php echo $package_row; ?>">
      			<td><input type="text" placeholder="" name="arrival_pkgs" value="" class="form-control" /></td>
      			<td>
      			<select name="packagetype" class="form-control">
                  <option value="1" selected="selected">-------------------------------</option>
                  <option value="2"><?php echo $text_packagetype_bag; ?></option>
				  <option value="3"><?php echo $text_packagetype_reel; ?></option>
				  <option value="4"><?php echo $text_packagetype_box; ?></option>
				  <option value="5"><?php echo $text_packagetype_bundle; ?></option>
				  <option value="6"><?php echo $text_packagetype_carton; ?></option>
				  <option value="7"><?php echo $text_packagetype_case; ?></option>
				  <option value="8"><?php echo $text_packagetype_crate; ?></option>
				  <option value="9"><?php echo $text_packagetype_drum; ?></option>
				  <option value="10"><?php echo $text_packagetype_pail; ?></option>
				  <option value="11"><?php echo $text_packagetype_roll; ?></option>
				  <option value="12"><?php echo $text_packagetype_package; ?></option>
				  <option value="13"><?php echo $text_packagetype_pallet; ?></option>
				  <option value="14"><?php echo $text_packagetype_piece; ?></option>
				  <option value="15"><?php echo $text_packagetype_skid; ?></option>
				  <option value="16"><?php echo $text_packagetype_other; ?></option>
                </select></td>
      			</tr>
      			 <?php $package_row++; ?>
              			<?php } ?>	
      			</tbody>
     		</table>
     		</div>	
     		 <button type="button" onclick="addDimension();" data-toggle="tooltip" title="<?php echo $button_package_add; ?>" class="btn btn-primary"><i class="fa fa-plus-circle"></i></button>
          	</div>
     		<a onclick=""><i class="fa fa-cube"></i> Dimensions</a> 
			    <div id="dimensions_hidden" >
					 <table id="dim" class="table table-striped table-bordered table-hover">
			            <thead>
			              <tr>
			             	<td class="text-left">PCS</td>
			                <td class="text-left">Length</td>
			                <td class="text-left">Width</td>
			                <td class="text-left">Height</td>
			                <td class="text-center">Cube</td>
			                <td class="text-center"></td>
			              </tr>
			            </thead>
			            <tbody>
			              	<?php $dim_row = 0; ?>
			              <?php foreach ($dimensions as $dimension) { ?>
              <tr id="dimension-row<?php echo $dim_row; ?>">
              <td class="text-left"><input type="text" name="dimension[<?php echo $dim_row; ?>][pcs]" value="<?php echo $dimension['pcs']; ?>" onChange="calcCube(<?php echo $dim_row; ?>)" class="form-control pcs" /></td>
              <td class="text-left"><input type="text" name="dimension[<?php echo $dim_row; ?>][length]" value="<?php echo $dimension['length']; ?>" onChange="calcCube(<?php echo $dim_row; ?>)"  class="form-control length"/></td>
              <td class="text-left"><input type="text" name="dimension[<?php echo $dim_row; ?>][width]" value="<?php echo $dimension['width']; ?>" onChange="calcCube(<?php echo $dim_row; ?>)"  class="form-control width"/></td>
			  <td class="text-left"><input type="text" name="dimension[<?php echo $dim_row; ?>][height]" value="<?php echo $dimension['height']; ?>" onChange="calcCube(<?php echo $dim_row; ?>)"  class="form-control height"/></td>
			  <td class="text-right" id="cube[<?php echo $dim_row; ?>]"><input type="text" disabled="disabled" name="cube[<?php echo $dim_row; ?>]" value="<?php echo $dimension['cube']; ?>"  class="form-control cube"/></td>
			 </tr>
			 
			 
			               <?php $dim_row++; ?>
              			<?php } ?>		    	
						 </tbody>
						 <tfoot>
              <tr>
               <td class="text-center" id ="pcs_total2"></td>
                <td class="text-center" id ="length_total"></td>
                <td class="text-center" id ="width_total"></td>
                <td class="text-center" id ="height_total"></td>
                <td id ="cube_total2" name="cube_total2"></td>
                <td class="text-right"><button type="button" onclick="addDimension();" data-toggle="tooltip" title="<?php echo $button_dimension_add; ?>" class="btn btn-primary"><i class="fa fa-plus-circle"></i></button></td>
              </tr>
              <tr><td colspan ="5"  class="text-center"> - inches to cubic feet -</td></tr>
            </tfoot>
					</table>

			    </div>
		    
	      </div>
	 
	  	  </div><!-- End of row -->
    <br>
     <div class="row">
     <div class=".col-lg-4 col-md-4 col-sm-6"><!--Source details -->
     <div class=""><?php echo $text_source_comparison; ?></div>
     <table class="table">
      			
      			 <tr>
              <td><?php echo $entry_arrival_source; ?></td>
              <td><?php echo $entry_arrival_weight; ?></td>
              <td><?php echo $entry_receipt_pieces; ?></td>
              <td><?php echo $entry_arrival_totalcube; ?></td>
            
            	</tr>
            	<tr>
              <td><?php echo $entry_arrival_arrival; ?></td>
              <td><input type="text" placeholder="" name="arrival_weight" value="" class="form-control"/></td>
              <td id="pcs_total" name="pcs_total"></td>
              <td id="cube_total" name="cube_total"></td>
            
            	</tr>
            	<tr>
              <td><?php echo $entry_arrival_bookedat; ?></td>
              <td><input type="text" placeholder="" name="arrival_bookedat_weight" value="" class="form-control"/></td>
              <td><input type="text" placeholder="" name="arrival_bookedat_cube" value="" class="form-control"/></td>
              <td><input type="text" placeholder="" name="arrival_bookedat_LP" value="" class="form-control"/></td>
             
            	</tr>
            	<tr>
              <td><?php echo $entry_arrival_slibl; ?></td>
              <td><input type="text" placeholder="" name="" value="" class="form-control"/></td>
              <td><input type="text" placeholder="" name="" value="" class="form-control"/></td>
              <td><input type="text" placeholder="" name="" value="" class="form-control"/></td>
              
            	</tr>
            	<tr>
              <td><?php echo $entry_arrival_booking; ?></td>
              <td><input type="text" placeholder="" name="arrival_booking_weight" value="" class="form-control"/></td>
              <td><input type="text" placeholder="" name="arrival_booking_pcs" value="" class="form-control"/></td>
              <td><input type="text" placeholder="" name="entry_arrival_booking_cube" value="" class="form-control"/></td>
              
            	</tr>
              <tr>
              <td></td>
              <td></td>
              <td></td>
              <td></td>
              
              	</tr>
              	
              </table>
              
  </div>
  <div class=".col-lg-2 col-md-2 col-sm-6">
   <div class=""><?php echo $entry_arrival_matchedbooking; ?></div>
  	<table class = "table">
  	<tr>
  		  <td><input type="text" placeholder="" name="arrival_match" value="" class="form-control"/></td></tr>
          <tr><td><input type="text" placeholder="Load Plan" name="" value="" class="form-control"/></td></tr>
          <tr><td><input type="text" placeholder="PE" name="" value="" class="form-control"/></td></tr>
          <tr><td><input type="text" placeholder="From" name="" value="" class="form-control"/></td></tr>
          <tr><td><input type="text" placeholder="To" name="entry_arrival_booking" value="" class="form-control"/></td>
  	</tr>
  	</table>
  </div>
  	
  
  <div class=".col-lg-2 col-md-2 col-sm-6">
   <div class=""><?php echo $entry_arrival_matchingissue; ?></div>
  	<table class = "table">
      		
            	<tr>
      		<td><input type="checkbox" id="inlineCheckbox1" value="<?php echo $entry_receipt_pieces; ?>"> <?php echo $entry_receipt_pieces; ?></label></td>
      		</tr>
            	<tr><td><input type="checkbox" id="inlineCheckbox1" value="<?php echo $entry_arrival_weight; ?>"> <?php echo $entry_arrival_weight; ?></label></td>
      		</tr>
            	<tr><td><input type="checkbox" id="inlineCheckbox1" value="<?php echo $entry_arrival_cube; ?>"> <?php echo $entry_arrival_cube; ?></label></td>
      		</tr>
            	<tr><td><input type="checkbox" id="inlineCheckbox1" value="<?php echo $entry_arrival_marks; ?>"> <?php echo $entry_arrival_marks; ?></label></td>
      		
      		</tr>
          <tr>
              
              <td>Discrepancy Resolved<p><input type="text" placeholder="" name="" value="" class="form-control"/></td>
              	</tr>
            	<tr>
      		<td >
      		 <button type="button" id="button_photo" data-toggle="tooltip" title="<?php echo $button_photo; ?>" data-loading-text="<?php echo $text_photo; ?>" class="btn btn-info photo">
				  <i class="fa fa-eye"></i>
				  </button>
      		
          
      		</td>
      		</tr>
      		
      		</table>	
  </div>
    <div class=".col-lg-2 col-md-2 col-sm-6">
 	 <div class=""><?php echo $text_arrival_actions; ?></div>
      			
      			<table class="table">
      			<tr >
      			<td><input type="checkbox" id="inlineCheckbox2" value="<?php echo $entry_arrival_stackable; ?>"> <?php echo $entry_arrival_stackable; ?>
      			to:<input type="text" placeholder="" name="entry_arrival_stackable" value="" size="3" /></td>
      			</tr>
              
              <tr><td>
              <input type="checkbox" id="inlineCheckbox2" value="<?php echo $entry_arrival_edited; ?>"> <?php echo $entry_arrival_edited; ?></td>
      			</tr>
              <tr><td>
              <input type="checkbox" id="inlineCheckbox2" value="<?php echo $entry_arrival_ignore; ?>"> <?php echo $entry_arrival_ignore; ?></td>
      			</tr>
              <tr><td>
             <input type="checkbox" id="inlineCheckbox2" value="<?php echo $entry_arrival_partial; ?>"> <?php echo $entry_arrival_partial; ?></td>
      			</tr>
              <tr><td>
             <input type="checkbox" id="inlineCheckbox2" value="<?php echo $entry_arrival_changepending; ?>"> <?php echo $entry_arrival_changepending; ?></td>
      			</tr>
              <tr><td>
             <input type="checkbox" id="inlineCheckbox2" value="<?php echo $entry_arrival_discrepancy; ?>"> <?php echo $entry_arrival_discrepancy; ?></td>
      			</tr>
              <tr><td>
             <input type="checkbox" id="inlineCheckbox2" value="<?php echo $entry_arrival_resolved; ?>"> <?php echo $entry_arrival_resolved; ?></td>
      			
      			
      			</tr>
     			</table>
     </div>			
  <div class=".col-lg-2 col-md-2 col-sm-6"><!--Source details -->
  <div class="">&nbsp;</div>
  	<table class = "table">
              		
              <tr>
              <td><?php echo $entry_arrival_intermodallp; ?></td> 
              <td><?php echo $entry_arrival_hazardous; ?></td>
              
              </tr>
              <tr>
              <td><input type="text" placeholder="" name="" value="" class="form-control"/></td>
               <td><input type="text" placeholder="" name="" value="" class="form-control"/></td>
              
               </tr>
              <tr>
              
              <td><input type="text" placeholder="" name="" value="" class="form-control"/></td>
              <td><input type="text" placeholder="" name="" value="" class="form-control"/></td>
              
              </tr>
              <tr>
              
              <td><input type="text" placeholder="" name="" value="" class="form-control"/></td>
              <td><input type="text" placeholder="" name="" value="" class="form-control"/></td>
               </tr>
              
              
     </table>
  
  	</div>
   </div><!-- End of row -->
  </div>
</div> <!-- End of Panel -->
	   <?php foreach($xml as $item){  ?>
			<?php echo $item; ?>
		<?php }; ?>
  
  



<script type="text/javascript">$(document).on("keydown keyup", function() {

	 calculateDimemsion();

	 function calculateDimemsion() {
		var cube = 0;
		var cube_t = 0; 
		var pcs = 0; 
		var length = 0; 
		var width = 0; 
		var height = 0; 

		
		$(".pcs").each(function() {
			if (!isNaN(this.value) && this.value.length != 0) {
				
				pcs += parseFloat(this.value); 
				
				$(this).css("background-color", "#FEFFB0"); } 
			
			else if (this.value.length != 0){
				
				$(this).css("background-color", "red"); }

		});
				
		$(".length").each(function() {
			if (!isNaN(this.value) && this.value.length != 0) {
				
				length += parseFloat(this.value); 
				
				$(this).css("background-color", "#FEFFB0"); } 
			
			else if (this.value.length != 0){
				
				$(this).css("background-color", "red"); }

		});
		$(".width").each(function() {
			if (!isNaN(this.value) && this.value.length != 0) {
				
				width += parseFloat(this.value); 
				
				$(this).css("background-color", "#FEFFB0"); } 
			
			else if (this.value.length != 0){
				
				$(this).css("background-color", "red"); }

		});
		$(".height").each(function() {
			if (!isNaN(this.value) && this.value.length != 0) {
				
				height += parseFloat(this.value); 
				
				$(this).css("background-color", "#FEFFB0"); } 
			
			else if (this.value.length != 0){
				
				$(this).css("background-color", "red"); }

		});
		$(".cube").each(function() {
			if (!isNaN(this.value) && this.value.length != 0) {
				
				cube_t += parseFloat(this.value); 
				
				$(this).css("background-color", "#FEFFB0"); } 
			
			else if (this.value.length != 0){
				
				$(this).css("background-color", "red"); }

		});

		
		var cube = (length*width*height)/1728;
		
		$("#pcs_total").html(pcs.toFixed(0));
		$("#pcs_total2").html(pcs.toFixed(0));
		//$("#length_total").html(length.toFixed(1));
		//$("#width_total").html(width.toFixed(1));
		//$("#height_total").html(height.toFixed(1));
		//$("#dim_total").html(cube.toFixed(1));
		$("#cube_total").html(cube_t.toFixed(1));
		$("#cube_total2").html(cube_t.toFixed(1));
		
	}

	
		
	
	}); 
</script>   
 <script type="text/javascript">

		
	function calcCube($x){
		var n1,n2,n3,n4;
		n1 = $("input[name='dimension["+$x+"][length]']").val();
		n2 = $("input[name='dimension["+$x+"][width]']").val();
		n3 = $("input[name='dimension["+$x+"][height]']").val();
		n4 = $("input[name='dimension["+$x+"][pcs]']").val();

		
		if (isNaN(n1)){n1=0;} else{n1=parseFloat(n1);}
		if (isNaN(n2)){n2=0;} else{n2=parseFloat(n2);}
		if (isNaN(n3)){n3=0;} else{n3=parseFloat(n3);}
		if (isNaN(n4)){n4=1;};
		
		n4 = parseFloat(n4);
	
		n1 = n1 * 2.54 ;
		n2 = n2 * 2.54 ;
		n3 = n3 * 2.54 ;
		
		cube = Math.round( n1 * n2 * n3 * 0.00353 * n4 ) / 100;
		$("input[name='cube["+$x+"]']").val(cube);
		
		$.post("controller/setting/ajaxpersist.php", { "fieldname" : "cube["+$x+"]", "value":cube});
	
		return cube;
	}
	
</script>
 <script type="text/javascript">
 		
	var dim_row =  <?php echo $dim_row; ?>;

	var package_row =  <?php echo $package_row; ?>;
	
	function addDimension() {
		html  = '<tr id="dim-row' + dim_row + '">';
		html += '  <td class="text-left"><input type="text" name="dimension[' + dim_row + '][pcs]" value="<?php echo $dimension['pcs']; ?>" onChange="calcCube(' + dim_row + ')" class="form-control pcs" /></td>';
		html += '  <td class="text-left"><input type="text" name="dimension[' + dim_row + '][length]" value="<?php echo $dimension['length']; ?>" onChange="calcCube(' + dim_row + ')"  class="form-control length"/></td>';
		html += '  <td class="text-left"><input type="text" name="dimension[' + dim_row + '][width]" value="<?php echo $dimension['width']; ?>" onChange="calcCube(' + dim_row + ')"  class="form-control width"/></td>';
		html += '  <td class="text-left"><input type="text" name="dimension[' + dim_row + '][height]" value="<?php echo $dimension['height']; ?>" onChange="calcCube(' + dim_row + ')"  class="form-control height"/></td>';
		html += '  <td class="text-right" id="cube[' + dim_row + ']"><input type="text" disabled="disabled" name="cube[' + dim_row + ']"   class="form-control cube"/></td>';
		html += '  <td class="text-left"><button type="button" onclick="$(\'#dim-row' + dim_row + '\').remove();"  class="btn btn-danger removeBtn"><i class="fa fa-minus-circle"></i></button></td>';
		html += '</tr>';
		
		$('#dim tbody').append(html);

		dim_row++;
	};
</script>  

 <script type="text/javascript">
	      $('#idd').datetimepicker({pickTime: false});
          $('#receipt_date').datetimepicker({pickTime: false});
          $('#receipt_date_out').datetimepicker({pickTime: false});
</script>

<script type="text/javascript"><!--

	$(document).on("click", ".photo", function(e) {
		//location.href= self.location;
		
		var pix = <?php echo $photo; ?>;
		var url= 'index.php?route=sale/customer/add&token=<?php echo $token; ?>&customer_group_id=<?php echo $customer; ?>';	
			
		bootbox.dialog({
			message: pix,
			title: "View Freight Pictures",
			
			buttons: {
				success: {
					label: "Add a New Contact",className: "btn-primary",callback: function() {
					window.location.href = url ;
	
				}},
				main: {
					 label: "Finished",
					 className: "btn-default",
					 callback: function() {
					 
					 }
				} 
			}
		}); 
	});

</script> 
  
  </form>
<?php echo $footer; ?>