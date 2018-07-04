	function who_submit()
	{
		var form1 = document.getElementById("form2");
		//alert("hello");
		var str=(document.getElementById("vhidden")).value;

		if(str=="allmaterial")
		{
			form1.action = "/demo/index.jsp" ;
			form1.submit();
		}
		if(str=="deliveryOrder")
		{
			form1.action = "/demo/jsp/SearchByID.jsp";
			form1.submit();
		}
		if(str=="pickingPerson")
		{
			form1.action = "/demo/jsp/SearchByName.jsp";
			form1.submit();
		}
		if(str=="information")
		{
			form1.action = "/demo/jsp/SearchByInformation.jsp";
			form1.submit();
		}

	}