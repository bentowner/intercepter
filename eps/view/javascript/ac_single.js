<script>
 $(document).ready(function(){
	    var url_reload= 'index.php?route=service/quotations/insertContacts&token=<?php echo $token; ?>&customer_id=';
	    var people = ['Full Service','Peter Bishop', 'Nicholas Brody', 'Gregory House', 'Hank Lawson', 'Tyrion Lannister', 'Nucky Thompson'];
	   
	    var cache = {};
	    var drew = false;
	    
	    $("#search").on("keyup", function(event){
	        var query = $("#search").val();
	        
	        
	 		 $.get('index.php?route=service/customer/getBookingCustomer&token=<?php echo $token; ?>&filter_custkey='+ query, function(data){
		    	list = JSON.parse(data);
				list2 = data;
		    	cust_list = {};
		    	
                $.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'ac_test', 'value':cust_list});
                
                response( $.map( data, function(item) {
                    // your operation on data
                    cust_list.push(data);
                }));
                
		    });
	 		 
			$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'ac_test3', 'value':list});
	 		
	 		 if($("#search").val().length > 2){
	            
	            //Check if we've searched for this term before
	            if(people in cache){
	                results = cache[query];
	            }
	            else{
	                //Case insensitive search for our people array
	                var results = $.grep(people, function(item){
	                    return item.search(RegExp(query, "i")) != -1;
	                });
	                
	                
	                //Add results to cache
	                cache[query] = results;
	                $.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'ac_test2', 'value':cache});
	                //alert(cache);
	               
	            }
	            //First search
	            if(drew == false){
	            	if (list.length == 1){ window.location = url_reload+list[0].CustCode; }
	            	
	                //Create list for results
	                $("#search").after('<ul id="res"></ul>');
	                //Prevent redrawing/binding of list
	                drew = true;
	                
	                //Bind click event to list elements in results
	                $("#res").on("click", "li", function(){
	                    $("#search").val($(this).text());
	                    $("#res").empty();
	                 });
	            } 
	            //Clear old results
	            else{
	                $("#res").empty();
	               
	                if (list.length == 1){ window.location = url_reload+list[0].CustCode; }
	            }
	          	
	            //Add results to the list
	            for(term in results){
	                $("#res").append("<li>" + results[term] + "</li>");
	            }
	        }
	        
	       
	    });
	});
    </script>