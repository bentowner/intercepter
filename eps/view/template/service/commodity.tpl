<div class='row'>
	 <div class="form-group required">
	 
        <div class="col-sm-12">
          <label class="control-label" for="commodity"><?php echo $entry_commodity; ?></label>
         
          <div >
            <input type="text" name="commodity" value="<?php echo $commodity; ?>" id="commodity" class="form-control" />
          </div>
        </div>
      </div> 
</div>    
<div class='row'>
	 <div class="form-group required">
	 
        <div class="col-sm-12">
          <label class="control-label" for="customerref"><?php echo $entry_customer_reference; ?></label>
         
          <div >
            <input type="text" name="customerref" value="<?php echo $customerref; ?>" id="customerref" class="form-control" />
          </div>
        </div>
      </div> 
</div> 
<div class='WM'>
<div class='row'>
	 <div class="form-group">
	 
        <div class="col-sm-3">
        <?php echo $entry_pieces; ?><input type="text" name="commodity_pieces" value="<?php echo $commodity_pieces; ?>" id="commodity_pieces" class="form-control" />
        </div>
        <div class="col-sm-5">
        <?php echo $entry_weight; ?><input type="text" name="commodity_lbs" value="<?php echo $commodity_lbs; ?>" id="commodity_lbs" onChange="if(document.getElementById('commodity_kg').value!=document.getElementById('commodity_lbs').value * 0.45359237) {UseNum=document.getElementById('commodity_lbs').value * 0.45359237;document.getElementById('commodity_kg').value=UseNum.toFixed(2)};"
        class="form-control" />
        </div>
        <div class="col-sm-4">
        <?php echo $entry_measure; ?><input type="text" name="commodity_cft" value="<?php echo $commodity_cft; ?>" id="commodity_cft" onchange="if (document.getElementById('commodity_cbm').value!=document.getElementById('commodity_cft').value * 0.0283168466) {UseNum=document.getElementById('commodity_cft').value * 0.0283168466 ;document.getElementById('commodity_cbm').value=UseNum.toFixed(3);};"class="form-control" />
        </div>
          
          
        </div>
</div> 
<div class='row'>
	 <div class="form-group">
	 
        
        <div class="col-sm-5 col-sm-offset-3">
       <input type="text" name="commodity_kg" value="<?php echo $commodity_kg; ?>" id="commodity_kg" class="form-control" onChange="if (document.getElementById('commodity_lbs').value!=document.getElementById('commodity_kg').value / 0.45359237) {UseNum=document.getElementById('commodity_kg').value / 0.45359237 ;document.getElementById('commodity_lbs').value=UseNum.toFixed(0);}" />
        </div>
        <div class="col-sm-4">
        <input type="text" name="commodity_cbm" value="<?php echo $commodity_cbm; ?>" id="commodity_cbm" class="form-control" onchange="if (document.getElementById('commodity_cft').value!=document.getElementById('commodity_cbm').value / 0.0283168466) {UseNum=document.getElementById('commodity_cbm').value / 0.0283168466 ;document.getElementById('commodity_cft').value=UseNum.toFixed(0);};"/>
        </div>
          
          
        </div>
</div> 
</div>    
<div class='row'>
	 <div class="form-group">
	 
        <div class="col-sm-12">
          <label class="control-label" for="instruction"><?php echo $entry_sli; ?></label>
         <div >
            <input type="text" name="instruction" value="<?php echo $instruction; ?>" id="instruction" class="form-control" />
          </div>
        </div>
      </div> 
</div>   

<?php if ($commodity_weightsurcharge=='true') { ?>

	 <div class="form-group">
	 	<div class='row'>
	        <div class="col-sm-12">
	          <label class="control-label" for="density"><?php echo $entry_commodity_density;?></label>
	         <div >
	            <input type="text" name="density" value="<?php echo $commodity_density; ?>" id="density" class="form-control" />
	          </div>
	        </div>
      	</div>
      
       <div class='row'>
	        <div class="col-sm-12">
	          <label class="control-label" for="commodity_density_approved"><?php echo $entry_commodity_density_approved; ?></label>
	         <div >
	            <input type="text" name="commodity_density_approved" value="<?php echo $commodity_density_approved; ?>" id="commodity_density_approved" class="form-control" />
	          </div>
	        </div>
      </div>
       
	 </div> 
  <?php } ?>
  
<?php if ($error_restrictions_cfri) { ?>

	 <div class="form-group">
	 	<div class='row'>
	        <div class="col-sm-12">
	          
	         <div >
	            <input type="text" placeholder="Harmonized Code if Available" name="service_harmonizedcode" value="<?php echo $service_harmonizedcode; ?>" id="service_harmonizedcode" class="form-control" />
	          </div>
	        </div>
      	</div>   
	 </div> 
  <?php } ?>
           


<script type="text/javascript">
	$("input[name=commodity]").change(function(){
	var commodity =$("#commodity").val();
	$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'commodity', 'value':commodity});
	});	
	
	$("input[name=customerref]").change(function(){
	var customerref =$("#customerref").val();
	$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'customerref', 'value':customerref});
	});
	
	$("input[name=instruction]").change(function(){
	var instruction = $("#instruction").val();
	$.post('controller/setting/ajaxpersist.php', {'fieldname' : 'instruction','value':instruction});
	$('input[name=\'instruction\']').val(instruction);
	});
	
</script>	
	
<script type="text/javascript">
$('.WM').on('change', function(e){ var regexp=/\D/g;	
var commodity_measure = $("input[name='commodity_measure']").val();
var commodity_pieces = $("input[name='commodity_pieces']").val();	
var commodity_lbs = $("input[name='commodity_lbs']").val();
var commodity_kg = $("input[name='commodity_kg']").val();	
var commodity_cft = $("input[name='commodity_cft']").val();
var commodity_cbm = $("input[name='commodity_cbm']").val();	
var commodity_lbs2 = new String(commodity_lbs);
var commodity_lbs3 = Number(commodity_lbs2.replace(/[^0-9\.]+/g,""));	
var commodity_kg2 = new String(commodity_kg);
var commodity_kg3 = Number(commodity_kg2.replace(/[^0-9\.]+/g,""));	
var commodity_cft2 = new String(commodity_cft);
var commodity_cft3 = Number(commodity_cft2.replace(/[^0-9\.]+/g,""));	
var commodity_cbm2 = new String(commodity_cbm);
var commodity_cbm3 = Number(commodity_cbm2.replace(/[^0-9\.]+/g,""));	

var commodity_cbm_check = parseFloat(commodity_cbm3);
if (commodity_cbm_check > 68 ){
	alert("Container capacity can not be exceeded!");
	//$('#error_nocommodity').val('Container capacity can not be exceeded!');
	$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'error_nocommodity', 'value':'Container capacity can not be exceeded!'}); 
}
$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'commodity_measure', 'value':commodity_measure});	
$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'commodity_pieces', 'value':commodity_pieces});	
$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'commodity_lbs', 'value':commodity_lbs3.toFixed(0)});	
$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'commodity_kg', 'value':commodity_kg3.toFixed(1)});
$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'weight', 'value':commodity_kg3});	
$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'commodity_cft', 'value':commodity_cft3});	
$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'commodity_cbm', 'value':commodity_cbm3});  });



</script>
          
          
                 