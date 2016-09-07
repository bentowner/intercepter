<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
       <a type="button" data-toggle="tooltip" title="<?php echo $button_add; ?>"  href="<?php echo $add_new; ?>" class="btn btn-primary"><i class="fa fa-plus"></i></a>
       <a type="button" id="button-booking-view" data-toggle="tooltip" title="<?php echo $button_booking_view; ?>" class="btn btn-info"><i class="fa fa-cubes"></i></a>
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
		
       <table class="table">
            
            <tr align = "center">
             <td><?php echo $entry_receipt_warehouse; ?></td>
             <td><?php echo $entry_receipt_receipt; ?></td>
             <td><?php echo $entry_receipt_cfs; ?></td>
             <td><?php echo $entry_receipt_date; ?></td>
             <td><?php echo $entry_receipt_date_out; ?></td>
             <td><?php echo $entry_receipt_days; ?></td>
             <td><?php echo $entry_receipt_section; ?></td> 
             <td><?php echo $entry_arrival_accountemail; ?></td> 
              <td><?php echo $entry_arrival_email; ?></td>
             <td><?php echo $entry_arrival_accountfax; ?></td>
             
             <td><?php echo $entry_arrival_fax; ?></td>
            </tr>
            
            <tr>
             <td><input type="text" placeholder="" name="entry_receipt_warehouse" value="" size="24" /></td>
             <td><input type="text" placeholder="" name="entry_receipt_receipt" value="" /></td>
             <td><input type="text" placeholder="" name="entry_receipt_cfs" value="" size="5" /></td>
             <td><input type="text" placeholder="" name="entry_receipt_date" value="" size="15" /></td>
             <td><input type="text" placeholder="" name="entry_receipt_date_out" value="" size="15" /></td>
             <td><input type="text" placeholder="" name="entry_receipt_days" value="" size="3" /></td>
             <td><input type="text" placeholder="" name="entry_receipt_section" value="" size="15" /></td>
             <td><input type="text" placeholder="" name="entry_arrival_accountemail" value="" size="24" /></td>
             
      			<td><input type="checkbox" id="inlineCheckbox2" value="<?php echo $entry_arrival_email; ?>"></label></td>
             <td><input type="text" placeholder="" name="entry_arrival_accountfax" value="" size="15" /></td>
             
      			<td><input type="checkbox" id="inlineCheckbox2" value="<?php echo $entry_arrival_fax; ?>"></label></td>
            </tr>
                    
            </table>
            
            </div><!--"booking-content" -->
			</div><!-- end "arrivals-detail" -->
	
	
			
        <div class ="arrivals-detail">
      			<div class="booking-content">
      			<table class="box">
            
            <tr>
              <td><?php echo $entry_arrival_receivedfrom; ?></td>
              <td><?php echo $entry_arrival_via; ?></td>
              <td><?php echo $entry_arrival_po; ?></td>
              <td><?php echo $entry_arrival_consignee; ?></td>
              <td><?php echo $entry_arrival_booking; ?></td>
              <td><?php echo $entry_arrival_attention; ?></td>
              <td><?php echo $entry_arrival_remarks; ?></td>
              <td><?php echo $entry_arrival_destination; ?></td>
              <td><?php echo $entry_arrival_transferfrom; ?> </td>
      			
            </tr>
            
            <tr>
            
            <td><input type="text" placeholder="" name="entry_receipt_receipt" value="" size="15" /></td>
            <td><input type="text" placeholder="" name="entry_receipt_receipt" value="" size="15" /></td>
            <td><input type="text" placeholder="" name="entry_receipt_receipt" value="" size="15" /></td>
            <td><input type="text" placeholder="" name="entry_receipt_receipt" value="" size="15" /></td>
            <td><input type="text" placeholder="" name="entry_receipt_receipt" value="" size="15" /></td>
            <td><input type="text" placeholder="" name="entry_receipt_receipt" value="" size="15" /></td>
            <td><input type="text" placeholder="" name="entry_receipt_receipt" value="" size="15" /></td>
            <td><input type="text" placeholder="" name="entry_receipt_receipt" value="" size="15" /></td>
            
      			<td><input type="text" placeholder="" name="entry_arrival_pkgs" value="" size="25" /></td>
            </tr>
            
            </table>
      		</div><!--"booking-content" -->
					
      		
      		<div class ="arrival-packagetype">
      			<div class="booking-content">
      			<table class="box">
      			<tr>
      			<td><?php echo $entry_arrival_pkgs; ?> </td>
      			<td><?php echo $entry_arrival_packagetype; ?>  </td>
      			</tr>
      			<tr>
      			<td><input type="text" placeholder="" name="entry_arrival_pkgs" value="" size="3" /></td>
      			
      			<td>
      			<select name="packagetype">
                  
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
     			</table>
     			</div><!--"booking-content" -->
			</div><!-- end "arrival-packagetype" -->
			
			<div class ="arrival-packagetype">
      			<div class="booking-content">
      			<table class="box">
      			<tr>
      			<td><?php echo $entry_arrival_pkgs; ?> </td>
      			<td><?php echo $entry_arrival_packagetype; ?>  </td>
      			</tr>
      			<tr>
      			<td><input type="text" placeholder="" name="entry_arrival_pkgs" value="" size="3" /></td>
      			
      			<td>
      			<select name="packagetype">
                  
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
     			</table>
     			</div><!--"booking-content" -->
			</div><!-- end "arrival-packagetype" -->
			<div class ="arrival-packagetype">
      			<div class="booking-content">
      			<table class="box">
      			<tr>
      			<td><?php echo $entry_arrival_pkgs; ?> </td>
      			<td><?php echo $entry_arrival_packagetype; ?>  </td>
      			</tr>
      			<tr>
      			<td><input type="text" placeholder="" name="entry_arrival_pkgs" value="" size="3" /></td>
      			
      			<td>
      			<select name="packagetype">
                  
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
     			</table>
     			</div><!--"booking-content" -->
			</div><!-- end "arrival-packagetype" -->
			
			<div class ="arrival-packagetype">
      			<div class="booking-content">
      			<table class="box">
      			<tr>
      			<td><?php echo $entry_arrival_pkgs; ?> </td>
      			<td><?php echo $entry_arrival_packagetype; ?>  </td>
      			</tr>
      			<tr>
      			<td><input type="text" placeholder="" name="entry_arrival_pkgs" value="" size="3" /></td>
      			
      			<td>
      			<select name="packagetype">
                  
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
     			</table>
     			</div><!--"booking-content" -->
			</div><!-- end "arrival-packagetype" -->
			
			</div><!-- end "arrivals-detail" -->
			
     		
					
    		<div class ="arrival-summary">
      				<div class="booking-heading"><?php echo $text_source_comparison; ?></div>
      			<div class="booking-content">
      			<table class="box">
      			
      			 <tr>
              <td><?php echo $entry_arrival_source; ?></td>
              <td><?php echo $entry_arrival_weight; ?></td>
              <td><?php echo $entry_receipt_pieces; ?></td>
              <td><?php echo $entry_arrival_totalcube; ?></td>
              <td><?php echo $entry_arrival_matchedbooking; ?></td>
            	</tr>
            	<tr>
              <td><?php echo $entry_arrival_arrival; ?></td>
              <td><input type="text" placeholder="" name="entry_arrival_arrival" value="" size="10" /></td>
              <td><input type="text" placeholder="" name="entry_arrival_arrival" value="" size="3" /></td>
              <td><input type="text" placeholder="" name="entry_arrival_arrival" value="" size="5" /></td>
              <td><input type="text" placeholder="" name="entry_arrival_arrival" value="" size="15" /></td>
            	</tr>
            	<tr>
              <td><?php echo $entry_arrival_bookedat; ?></td>
              <td><input type="text" placeholder="" name="entry_arrival_bookedat" value="" size="10" /></td>
              <td><input type="text" placeholder="" name="entry_arrival_bookedat" value="" size="3" /></td>
              <td><input type="text" placeholder="" name="entry_arrival_bookedat" value="" size="5" /></td>
              <td><input type="text" placeholder="Load Plan" name="entry_arrival_bookedat" value="" size="15" /></td>
            	</tr>
            	<tr>
              <td><?php echo $entry_arrival_slibl; ?></td>
              <td><input type="text" placeholder="" name="entry_arrival_slibl" value="" size="10" /></td>
              <td><input type="text" placeholder="" name="entry_arrival_slibl" value="" size="3" /></td>
              <td><input type="text" placeholder="" name="entry_arrival_slibl" value="" size="5" /></td>
              <td><input type="text" placeholder="PE" name="entry_arrival_slibl" value="" size="15" /></td>
            	</tr>
            	<tr>
              <td><?php echo $entry_arrival_booking; ?></td>
              <td><input type="text" placeholder="" name="entry_arrival_booking" value="" size="10" /></td>
              <td><input type="text" placeholder="" name="entry_arrival_booking" value="" size="3" /></td>
              <td><input type="text" placeholder="" name="entry_arrival_booking" value="" size="5" /></td>
              <td><input type="text" placeholder="From" name="entry_arrival_booking" value="" size="15" /></td>
            	</tr>
              <tr>
              <td></td>
              <td></td>
              <td></td>
              <td></td>
              <td><input type="text" placeholder="To" name="entry_arrival_booking" value="" size="15" /></td>
              	</tr>
              	
              </table>
              	<table class = "box">
              		
              <tr>
              <td><?php echo $entry_arrival_intermodallp; ?></td> 
              <td><?php echo $entry_arrival_hazardous; ?></td>
              
              </tr>
              <tr>
              <td><input type="text" placeholder="" name="entry_arrival_intermodallp" value="" size="10" /></td>
               <td><input type="text" placeholder="" name="entry_arrival_booking" value="" size="10" /></td>
              
               </tr>
              <tr>
              
              <td><input type="text" placeholder="" name="entry_arrival_intermodallp" value="" size="10" /></td>
              <td><input type="text" placeholder="" name="entry_arrival_booking" value="" size="35"  /></td>
              
              </tr>
              <tr>
              
              <td><input type="text" placeholder="" name="entry_arrival_intermodallp" value="" size="10" /></td>
              <td>Discrepancy Resolved  <input type="text" placeholder="" name="" value="" size="5"  /></td>
               </tr>
              <tr>
              
              <td><input type="text" placeholder="" name="entry_arrival_intermodallp" value="" size="10" /></td>
              	</tr>
              
      			</table>
      		<table class = "box">
      		<tr>
      		<td><?php echo $entry_arrival_matchingissue; ?></td>
      		<td><input type="checkbox" id="inlineCheckbox1" value="<?php echo $entry_receipt_pieces; ?>"><?php echo $entry_receipt_pieces; ?></label></td>
      		<td><input type="checkbox" id="inlineCheckbox1" value="<?php echo $entry_arrival_weight; ?>"><?php echo $entry_arrival_weight; ?></label></td>
      		<td><input type="checkbox" id="inlineCheckbox1" value="<?php echo $entry_arrival_cube; ?>"><?php echo $entry_arrival_cube; ?></label></td>
      		<td><input type="checkbox" id="inlineCheckbox1" value="<?php echo $entry_arrival_marks; ?>"><?php echo $entry_arrival_marks; ?></label></td>
      		
      		<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      		</td>
      		<td class="buttons">
      		<a href="<?php echo $photo; ?>" class="button"><?php echo $button_photo; ?></a>
          
      		</td>
      		</tr>
      		
      		</table>	
      			
    		</div><!--"booking-content" -->
			</div><!-- end "arrival-summary" -->
            
            	<div class ="arrival-status">
      				<div class="booking-heading"><?php echo $text_arrival_actions; ?></div>
      			<div class="booking-content">
      			<table class="box">
      			<tr align = "center">
      			<td><input type="checkbox" id="inlineCheckbox2" value="<?php echo $entry_arrival_stackable; ?>"><?php echo $entry_arrival_stackable; ?></label></td>
      			<td><input type="text" placeholder="" name="entry_arrival_stackable" value="" size="3" /></td>
      			<td><?php echo $entry_arrival_edited; ?><input type="checkbox" id="inlineCheckbox2" value="<?php echo $entry_arrival_edited; ?>"></label></td>
      			<td><?php echo $entry_arrival_ignore; ?><input type="checkbox" id="inlineCheckbox2" value="<?php echo $entry_arrival_ignore; ?>"></label></td>
      			<td><?php echo $entry_arrival_partial; ?><input type="checkbox" id="inlineCheckbox2" value="<?php echo $entry_arrival_partial; ?>"></label></td>
      			<td><?php echo $entry_arrival_changepending; ?><input type="checkbox" id="inlineCheckbox2" value="<?php echo $entry_arrival_changepending; ?>"></label></td>
      			<td><?php echo $entry_arrival_discrepancy; ?><input type="checkbox" id="inlineCheckbox2" value="<?php echo $entry_arrival_discrepancy; ?>"></label></td>
      			<td><?php echo $entry_arrival_resolved; ?><input type="checkbox" id="inlineCheckbox2" value="<?php echo $entry_arrival_resolved; ?>"></label></td>
      			
      			
      			</tr>
     			</table>
     			</div><!--"booking-content" -->
			</div><!-- end "arrival-status" -->
		<div class ="arrival-status">
			<div class="booking-heading"><?php echo $text_item_specifics; ?></div>
      			<div class="booking-content">
      			
      			<table>
      			<tr><td>
      			
      			<table>
      			<tr>
      			<td><?php echo $entry_arrival_marks; ?> </td>
      			<td><img src="view/image/add.png" alt="" onclick="addRow('dataTable')" /></td>
     			<td><img src="view/image/delete.png" alt="" onclick="deleteRow('dataTable')" /></td>
     			
      			</tr>
      			
      			<tr>
      			<td><textarea name="entry_arrival_marks" cols="23" rows="7"></textarea></td>
      			</tr>
      			</table>
      			</td><td>
      			<table>
      			<tr>
      			<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $entry_receipt_pieces; ?></td>
     			<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $entry_arrival_length; ?> </td>
     			<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $entry_arrival_width; ?> </td>
     			<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $entry_arrival_height; ?> </td>
     			<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $entry_arrival_cube; ?> </td>
      			</tr>
     			</table>
     			<table id="dataTable" class="box">
  		
      			<TR>
      			
			    <TD><INPUT type="checkbox" name="chk" size="5"/></TD>
			    <TD><INPUT type="text" placeholder="<?php echo $entry_receipt_pieces; ?>" name="receipt_pieces[]" value="" size="5" /></TD>
      			<TD><INPUT type="text" placeholder="<?php echo $entry_arrival_length; ?>" name="arrival_length[]" value="" size="5" /></TD>
      			<TD><INPUT type="text" placeholder="<?php echo $entry_arrival_width; ?>" name="arrival_width[]" value="" size="5" /></TD>
      			<TD><INPUT type="text" placeholder="<?php echo $entry_arrival_height; ?>" name="arrival_height[]" value="" size="5" /></TD>
      			<TD><INPUT type="text" placeholder="<?php echo $entry_arrival_cube; ?>" name="arrival_cube[]" value="" size="5" /></TD>
      			
      			</TR>
      			
     			</table>
     			</td></tr>
     			</table>
     			
     			</div><!--"booking-content" -->
			</div><!-- end "arrival-status" -->
			

			
			
      </div>
    </div>
  </div><!-- end content -->
     <SCRIPT language="javascript">
      //http://viralpatel.net/blogs/dynamically-add-remove-rows-in-html-table-using-javascript/   	
        function addRow(tableID) {
 
            var table = document.getElementById(tableID);
 
            var rowCount = table.rows.length;
            var row = table.insertRow(rowCount);
 
            var colCount = table.rows[0].cells.length;
 
            for(var i=0; i<colCount; i++) {
 
                var newcell = row.insertCell(i);
 
                newcell.innerHTML = table.rows[0].cells[i].innerHTML;
                //alert(newcell.childNodes);
                switch(newcell.childNodes[0].type) {
                    case "text":
                            newcell.childNodes[0].value = "";
                            break;
                    case "checkbox":
                            newcell.childNodes[0].checked = false;
                            break;
                    case "select-one":
                            newcell.childNodes[0].selectedIndex = 0;
                            break;
                }
            }
        }
 
        function deleteRow(tableID) {
            try {
            var table = document.getElementById(tableID);
            var rowCount = table.rows.length;
 
            for(var i=0; i<rowCount; i++) {
                var row = table.rows[i];
                var chkbox = row.cells[0].childNodes[0];
                if(null != chkbox && true == chkbox.checked) {
                    if(rowCount <= 1) {
                        alert("Cannot delete all the rows.");
                        break;
                    }
                    table.deleteRow(i);
                    rowCount--;
                    i--;
                }
 
 
            }
            }catch(e) {
                alert(e);
            }
        }
 
    </SCRIPT>
    
    <script type="text/javascript"><!-- adds placeholder for x-browser support, removes before submit form.
	$('[placeholder]').focus(function() {var input = $(this); if (input.val() == input.attr('placeholder')) {input.val('');input.removeClass('placeholder');}}).blur(function() {
    var input = $(this);if (input.val() == '' || input.val() == input.attr('placeholder')) {input.addClass('placeholder');input.val(input.attr('placeholder'));}}).blur();
	$('[placeholder]').parents('form').submit(function() {$(this).find('[placeholder]').each(function() {var input = $(this);if (input.val() == input.attr('placeholder')) {input.val('');}})});//--></script>
    
<?php echo $footer; ?>