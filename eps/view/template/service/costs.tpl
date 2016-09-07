		
			<div class=".col-lg-6 col-md-6 col-sm-6">
			<legend><?php echo $text_debit; ?></legend>
				<div class ="table-responsive">
        
          <table class="table table-bordered">
          
            <tr>
              <td><?php echo $entry_rateitem; ?></td><td></td>
            </tr>
            <tr>
              <td><?php echo $entry_costs_precarriage; ?></td>
              <td><input disabled="disabled"class="txtDebit form-control" type="text" placeholder="" id="truckingrate" name="truckingrate" value="<?php echo $truckingrate_min;?>"  /></td>
            </tr>    
            <tr>
              <td><?php echo $entry_costs_insurance; ?></td>
              <td><input class="txtDebit form-control" type="text" placeholder="" id="costs_insurance" name="costs_insurance" value="<?php echo $costs_insurance;?>"  /></td>
            </tr>
            <tr>
              <td><?php echo $entry_costs_inoutcharges; ?></td>
              <td><input class="txtDebit form-control" type="text" placeholder="" id="costs_inoutcharges"  name="costs_inoutcharges" value="<?php echo $costs_inoutcharges;?>"  /></td>
            </tr>
            <tr>
              <td><?php echo $entry_costs_palletization; ?></td>
              <td><input class="txtDebit form-control" type="text" placeholder="" id="costs_palletization" name="costs_palletization" value="<?php echo $costs_palletization;?>"  /></td>
            </tr>
            <tr>
              <td><?php echo $entry_costs_segregation; ?></td>
              <td><input class="txtDebit form-control" type="text" placeholder="" id="costs_segregation" name="costs_segregation" value="<?php echo $costs_segregation;?>"  /></td>
            </tr>
            
            <tr>
            <td><input type="text"  id="costs_other_text"  name="costs_other_text" value="<?php echo $costs_other_text;?>" class="form-control" /></td>
            <td><input class="txtDebit form-control" type="text" id="costs_other_quote"  name="costs_other_quote" value="<?php echo $costs_other_quote;?>" size="25" /></td>
            </tr>
            <tr>
            <td>&nbsp;</td><td>&nbsp;</td>
            </tr>
            <tr>
              <td><?php echo $entry_costs_totaldebit; ?></td>
              <td class="total" align="left">$<span id="sumDebit">0</span></td>
            </tr>
            
            </table>
            
            </div><!--"booking-content" -->
			</div><!-- end "costs-debit" -->	
            
            
            
            <div class=".col-lg-6 col-md-6 col-sm-6">
            <legend><?php echo $text_credit; ?></legend>
				<div class ="table-responsive">
        
           <table class="table table-bordered">
          
           	<tr>
              <td><?php echo $entry_rateitem; ?></td><td></td><td></td><td><?php echo $entry_costs_quote; ?></td><td><?php echo $entry_costs_booking; ?></td>
            </tr>
            <tr>
              <td><?php echo $entry_costs_oncarriage; ?></td>
              <td></td>
              <td><input type="text" placeholder="CURR" name="costs_oncarriage_currency" value="<?php echo $costs_oncarriage_currency; ?>" class="form-control" /></td>
              <td><input class="txtCredit_quote form-control" type="text" placeholder="" id="costs_oncarriage_quote" name="costs_oncarriage_quote" value="<?php echo $costs_oncarriage_quote; ?>"  /></td>
              <td><input disabled = "true" class="txtCredit_booking form-control" type="text" placeholder="" name="costs_oncarriage" value="<?php echo $costs_oncarriage; ?>"  /></td>
            </tr>
            <tr>
              <td><input type="text" placeholder="" name="costs_other_text"  id="costs_other_text" value="<?php echo $entry_other2; ?>" class="form-control" /></td>
              <td><?php echo $entry_rates_flat; ?></td>
              <td></td>
              <td><input class="txtCredit_quote form-control" type="text" placeholder="" id="costs_desc2cost_quote" name="costs_desc2cost_quote" value="<?php echo $costs_desc2cost_quote; ?>"  /></td>
              <td><input disabled = "true" class="txtCredit_booking form-control" type="text" placeholder="" name="costs_desc2cost" value="<?php echo $costs_desc2cost; ?>" /></td>
            </tr>
            <tr>
              <td><input type="text" placeholder="" name="" value="" class="form-control" /></td>
              <td><?php echo $entry_rates_wm; ?></td>
              <td></td>
              <td><input class="txtCredit_quote form-control" type="text" placeholder=""  id="costs_desc3cost_quote"  name="costs_desc3cost_quote" value="<?php echo $costs_desc3cost_quote; ?>"  /></td>
              <td><input disabled = "true" class="txtCredit_booking form-control" type="text" placeholder="" name="costs_desc3cost" value="<?php echo $costs_desc3cost; ?>"  /></td>
            </tr>
            <tr>
              <td><?php echo $entry_costs_thc2; ?></td>
              <td></td>
              <td></td>
              <td><input class="txtCredit_quote form-control" type="text" placeholder="" id="costs_thc2_quote" name="costs_thc2_quote" value="<?php echo $costs_thc2_quote; ?>" /></td>
              <td><input disabled = "true" class="txtCredit_booking form-control" type="text" placeholder="" name="costs_thc2" value="<?php echo $costs_thc2; ?>" /></td>
            </tr>
            
            <tr>
              <td><?php echo $entry_costs_destdocs; ?></td>
              <td><?php echo $entry_rates_flat; ?></td>
              <td></td>
              <td><input class="txtCredit_quote form-control" type="text" placeholder="" id="costs_destdocs_quote" name="costs_destdocs_quote" value="<?php echo $costs_destdocs_quote; ?>"  /></td>
              <td><input disabled = "true" class="txtCredit_booking form-control" type="text" placeholder="" name="costs_destdocs" value="<?php echo $costs_destdocs; ?>"  /></td>
            </tr>
            <tr>
              <td><?php echo $entry_costs_destcharges; ?></td>
              <td><?php echo $entry_rates_flat; ?></td>
              <td><input type="text" placeholder="" name="" class="form-control" /></td>
              <td><input class="txtCredit_quote form-control" type="text" placeholder=""  id="costs_destcharges_quote" name="costs_destcharges_quote" value="<?php echo $costs_destcharges_quote; ?>"  /></td>
              <td><input disabled = "true" class="txtCredit_booking form-control" type="text" placeholder="" name="costs_destcharges" value="<?php echo $costs_destcharges; ?>"  /></td>
            </tr>
            <tr>
              <td><?php echo $entry_costs_customsclearance; ?></td>
              <td></td>
              <td></td>
              <td><input class="txtCredit_quote form-control" type="text" placeholder="" id="costs_customsclearance_quote" name="costs_customsclearance_quote" value="<?php echo $costs_customsclearance_quote; ?>"  /></td>
              <td><input disabled = "true" class="txtCredit_booking form-control" type="text" placeholder="" name="costs_customsclearance" value="<?php echo $costs_customsclearance; ?>"  /></td>
            </tr>
            <tr>
              <td><?php echo $entry_costs_totalcredit; ?></td>
              <td></td>
              <td></td>
             
  			  <td class="total" align="right" >$<span id="sumCredit_quote">0</span></td>
              <td class="total" align="right">$<span id="sumCredit_booking">0</span></td>
            </tr>
            </table>
            </div><!--"booking-content" -->
			</div><!-- end "costs-credit" -->
		<div class=".col-lg-6 col-md-6 col-sm-6">
		<div class="costs-hazardous">
      				<legend><?php echo $text_hazardous; ?></legend>
			<div class ="table-responsive">
			
			<table class="table table-bordered">
          
           	<tr>
           	<td><?php echo $entry_rate; ?></td>
           	<td><input type="text" placeholder="" id="Bkhtsr" name="Bkhtsr" value="<?php echo $Bkhtsr; ?>" class="form-control" /></td>
           	<td><?php echo $entry_costs_minimum; ?></td>
           	<td><input type="text" placeholder="" id="BkHtsm" name="BkHtsm" value="<?php echo $BkHtsm; ?>" class="form-control" /></td>
			</tr>
            </table>
				
			</div><!--"booking-content" -->
		</div><!-- end "costs-hazardous" -->
		</div>
		<div class=".col-lg-6 col-md-6 col-sm-6">
		<div class ="costs-profit">
      				<legend><?php echo $text_profitshare; ?></legend>
				<div class ="table-responsive">
			<table class="table table-bordered">
          
           	<tr>
           	<td><?php echo $entry_costs_profitsharedue; ?></td><td>&nbsp;</td><td>&nbsp;</td>
           	<td><input type="text" placeholder="" name="entry_profitsharedue" value="" class="form-control" /></td>
           	</tr>
            </table>
		</div><!--"booking-content" -->
			</div><!-- end "costs-profit" -->
		</div>	
		
<script type="text/javascript">$("input[name=Bkhtsr]").change(function(){
	var Bkhtsr = $("#Bkhtsr").val();	
	$.post('controller/setting/ajaxpersist.php', {'fieldname' : 'Bkhtsr','value':Bkhtsr} );
	$('input[name=\'Bkhtsr\']').val(Bkhtsr);	
	
	});	</script>
<script type="text/javascript">$("input[name=BkHtsm]").change(function(){	
	var BkHtsm = $("#BkHtsm").val();	
	$.post('controller/setting/ajaxpersist.php', {'fieldname' : 'BkHtsm','value':BkHtsm} );
	$('input[name=\'BkHtsm\']').val(BkHtsm);	
	
	});
</script>
<script type="text/javascript">
	$("input[name=costs_insurance]").change(function(){	
		var costs_insurance = $("#costs_insurance").val();	
		$.post('controller/setting/ajaxpersist.php', {'fieldname' : 'costs_insurance','value':costs_insurance} );
		$('input[name=\'costs_insurance\']').val(costs_insurance);	
	});	

	$("input[name=costs_inoutcharges]").on('change',function(){	
		var costs_inoutcharges = $("#costs_inoutcharges").val();	
		$.post('controller/setting/ajaxpersist.php', {'fieldname' : 'costs_inoutcharges','value':costs_inoutcharges} );
		$('input[name=\'costs_inoutcharges\']').val(costs_inoutcharges);	
		
	});	
	$("input[name=costs_palletization]").on('change',function(){	
		var costs_palletization = $("#costs_palletization").val();	
		$.post('controller/setting/ajaxpersist.php', {'fieldname' : 'costs_palletization','value':costs_palletization} );
		$('input[name=\'costs_palletization\']').val(costs_palletization);	
		
	});	
	$("input[name=costs_segregation]").on('change',function(){	
		var costs_segregation = $("#costs_segregation").val();	
		$.post('controller/setting/ajaxpersist.php', {'fieldname' : 'costs_segregation','value':costs_segregation} );
		$('input[name=\'costs_segregation\']').val(costs_segregation);	
		
	});	
	$("input[name=costs_other_text]").on('change',function(){	
		var costs_other_text = $("#costs_other_text").val();	
		$.post('controller/setting/ajaxpersist.php', {'fieldname' : 'costs_other_text','value':costs_other_text} );
		$('input[name=\'costs_other_text\']').val(costs_other_text);	
		
	});	
	$("input[name=costs_other]").on('change',function(){	
		var costs_other = $("#costs_other").val();	
		$.post('controller/setting/ajaxpersist.php', {'fieldname' : 'costs_other','value':costs_other} );
		$('input[name=\'costs_other\']').val(costs_other);	
		
	});	
	$("input[name=costs_oncarriage_quote]").on('change',function(){	
		var costs_oncarriage_quote = $("#costs_oncarriage_quote").val();	
		$.post('controller/setting/ajaxpersist.php', {'fieldname' : 'costs_oncarriage_quote','value':costs_oncarriage_quote} );
		$('input[name=\'costs_oncarriage_quote\']').val(costs_oncarriage_quote);	
		
	});	
	$("input[name=costs_desc2cost_quote]").on('change',function(){	
		var costs_desc2cost_quote = $("#costs_desc2cost_quote").val();	
		$.post('controller/setting/ajaxpersist.php', {'fieldname' : 'costs_desc2cost_quote','value':costs_desc2cost_quote} );
		$('input[name=\'costs_desc2cost_quote\']').val(costs_desc2cost_quote);	
		
	});	
	$("input[name=costs_desc3cost_quote]").on('change',function(){	
		var costs_desc3cost_quote = $("#costs_desc3cost_quote").val();	
		$.post('controller/setting/ajaxpersist.php', {'fieldname' : 'costs_desc3cost_quote','value':costs_desc3cost_quote} );
		$('input[name=\'costs_desc3cost_quote\']').val(costs_desc3cost_quote);	
		
	});	
	$("input[name=costs_thc2_quote]").on('change',function(){	
		var costs_thc2_quote = $("#costs_thc2_quote").val();	
		$.post('controller/setting/ajaxpersist.php', {'fieldname' : 'costs_thc2_quote','value':costs_thc2_quote} );
		$('input[name=\'costs_thc2_quote\']').val(costs_thc2_quote);	
		
	});	
	$("input[name=costs_destdocs_quote]").on('change',function(){	
		var costs_destdocs_quote = $("#costs_destdocs_quote").val();	
		$.post('controller/setting/ajaxpersist.php', {'fieldname' : 'costs_destdocs_quote','value':costs_destdocs_quote} );
		$('input[name=\'costs_destdocs_quote\']').val(costs_destdocs_quote);	
		
	});	
	$("input[name=costs_destcharges_quote]").on('change',function(){	
		var costs_destcharges_quote = $("#costs_destcharges_quote").val();	
		$.post('controller/setting/ajaxpersist.php', {'fieldname' : 'costs_destcharges_quote','value':costs_destcharges_quote} );
		$('input[name=\'costs_destcharges_quote\']').val(costs_destcharges_quote);	
		
	});	
	$("input[name=costs_customsclearance_quote]").on('change',function(){	
		var costs_customsclearance_quote = $("#costs_customsclearance_quote").val();	
		$.post('controller/setting/ajaxpersist.php', {'fieldname' : 'costs_customsclearance_quote','value':costs_customsclearance_quote} );
		$('input[name=\'costs_customsclearance_quote\']').val(costs_customsclearance_quote);	
		
	});	
	$("input[name=costs_other_quote]").on('change',function(){	
		var costs_other_quote = $("#costs_other_quote").val();	
		$.post('controller/setting/ajaxpersist.php', {'fieldname' : 'costs_other_quote','value':costs_other_quote} );
		$('input[name=\'costs_other_quote\']').val(costs_other_quote);	
		
	});	
</script>
            
<script type="text/javascript">$(document).ready(function() {calculateSumDebit();
	
	$(".txtDebit").on("keydown keyup", function() {
	calculateSumDebit();});}); 
	
	function calculateSumDebit() {
		var sumDebit = 0; 
		$(".txtDebit").each(function() {
			if (!isNaN(this.value) && this.value.length != 0) {
				sumDebit += parseFloat(this.value); 
				$(this).css("background-color", "#FEFFB0"); } 
			else if (this.value.length != 0){
				$(this).css("background-color", "red"); }});
			$("#sumDebit").html(sumDebit.toFixed(2));
			$("#sumDebit2").html(sumDebit.toFixed(2));	
			$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'total_debit', 'value':(sumDebit.toFixed(2))})
			;}
</script>
<script type="text/javascript">$(document).ready(function() {calculateSumCredit_quote();
$(".txtCredit_quote").on("keydown keyup", function() {
	calculateSumCredit_quote();});}); 
	function calculateSumCredit_quote() {
		var sumCredit_quote = 0; 
		$(".txtCredit_quote").each(function() {
			if (!isNaN(this.value) && this.value.length != 0) {
				sumCredit_quote += parseFloat(this.value); 
				$(this).css("background-color", "#FEFFB0"); } 
			else if (this.value.length != 0){
				$(this).css("background-color", "red"); }});
			$("#sumCredit_quote").html(sumCredit_quote.toFixed(2));
			$("#sumCredit_quote2").html(sumCredit_quote.toFixed(2));	
			$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'total_credit_quote', 'value':(sumCredit_quote.toFixed(2))})
			;}
</script>
<script type="text/javascript">$(document).ready(function() {calculateSumCredit_booking();

	$(".txtCredit_booking").on("keydown keyup", function() {
		calculateSumCredit_booking();	});
	}); 
	
	function calculateSumCredit_booking() {
		var sumCredit_booking = 0; 
		$(".txtCredit_booking").each(function() {
			if (!isNaN(this.value) && this.value.length != 0) {
				sumCredit_booking += parseFloat(this.value); 
				$(this).css("background-color", "#FEFFB0"); } 
			else if (this.value.length != 0){
				$(this).css("background-color", "red"); }});
			$("#sumCredit_booking").html(sumCredit_booking);
			$("#sumCredit_booking2").html(sumCredit_booking);	
			$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'total_credit_booking', 'value':sumCredit_booking})
			;}
</script>
