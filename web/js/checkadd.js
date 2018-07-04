        // //取值
        // function validate_form(thisform)
        // {
			// with (thisform)
			// {	//出库编号
        //         if (validate_required(deliveryOrder,"请填写出库单据号！")==false)
        //         {deliveryOrder.focus();return false;}
        //         if (validate_number(deliveryOrder,"数据编号不可小于1位，不可多于11位！")==false)
        //         {deliveryOrder.focus();return false;}
        //
        //
        //         if (validate_required(money,"请填写金额！")==false)
        //         {deliveryOrder.focus();return false;}
        //         if (validate_required(money,"格式错错误，保留两位小数，整数位不可超过10位，例如：59999.20！")==false)
        //         {deliveryOrder.focus();return false;}
        //
        //
        //         if (validate_required(pickingDate,"请填写领料日期！")==false)
        //         {deliveryOrder.focus();return false;}
        //         if (validate_required(pickingPerson,"请填写领料人姓名！")==false)
        //         {deliveryOrder.focus();return false;}
        //         if (validate_required(pickingDepartment,"请填写领料部门名称！")==false)
        //         {deliveryOrder.focus();return false;}
        //         if (validate_required(keeper,"请填写库管员姓名！")==false)
        //         {deliveryOrder.focus();return false;}
        //         if (validate_required(auditor,"请填写审核人员姓名！")==false)
        //         {deliveryOrder.focus();return false;}
        //         if (validate_required(auditDate,"请填写出库单据号！")==false)
        //         {deliveryOrder.focus();return false;}
        //         if (validate_required(numberofMaterial,"请填写审核日期！")==false)
        //         {deliveryOrder.focus();return false;}
        //         if (validate_required(deliveryOrder,"请填写领料数量！")==false)
        //         {deliveryOrder.focus();return false;}
        //
			// }
        // }
        // function validate_length(field, limit,alerttxt)
        // {
			// with (field) {
	     //    	if (length > limit) {
	     //    		alert(alerttxt);
	     //    		return false;
	     //    	}
	     //    	else {return true;}
			// }
        // }
        // // function validate_number(field, alerttxt)
        // // {//
        // // 	with (field) {
	     // //    	if (!(/^(0|[1-9]\d{0,2})$/.test(value))) {//
	     // //     		alert(alerttxt);
	     // //    		return false;
        // //
	     // //    	}
	     // //    	else {return true;}
        // // 	}
        // // }
        // function validate_realnumber(field,alerttxt)
        // {
			// with (field)
			// {
			// 	if(!(/^(0|[1-9]\d{0,2})(\.\d{2})?$/.test(value)))
			// 	{
			// 		alert(alerttxt);
	     //    		return false;
			// 	}
			// 	else{return true;}
			// }
        // }
        // function validate_date(field,alerttxt)
        // {
			// with (field)
			// {
			// 	if(!(/^(?:(?!0000)[0-9]{4}-(?:(?:0[1-9]|1[0-2])-(?:0[1-9]|1[0-9]|2[0-8])|(?:0[13-9]|1[0-2])-(?:29|30)|(?:0[13578]|1[02])-31)|(?:[0-9]{2}(?:0[48]|[2468][048]|[13579][26])|(?:0[48]|[2468][048]|[13579][26])00)-02-29)$/.test(value)))
			// 	{
			// 		alert(alerttxt);
	     //    		return false;
			// 	}
			// 	else{return true;}
			// }
        // }
        // //校验两次密码不同
        // function check(alerttxt)
        // {
		 //   with(document.all){
		 //   if(password1.value!=password2.value)
		 //   {
		 //     alert(alerttxt);
			//  password1.value = "";
		 //     password2.value = "";
			//  return false;
		 //   }else
		 //   {return true;}
		 //   }
        // }
        // //检验人名
        // function validate_name(field,alerttxt)
        // {
        //     with (field)
        //     {
        //         if(!(/^[\u4E00-\u9FA5\uf900-\ufa2d·s]{2,20}$/.test(value)))
        //         {
        //             alert(alerttxt);
        //             return false;
        //         }
        //         else{return true;}
        //     }
        // }
        // //检验备注事项，不可超过20字
        //
        // //检验日期/^\d{4}\-\d{2}\-\d{2}$/   yyyy-MM-dd
        // function validate_date(field,alerttxt)
        // {
        //     with (field)
        //     {
        //         if(!(/^\d{4}\-\d{2}\-\d{2}$/.test(value)))
        //         {
        //             alert(alerttxt);
        //             return false;
        //         }
        //         else{return true;}
        //     }
        // }
        //
        // 检验单据数字位数限制
        // function validate_number(field, alerttxt)
        // {//
        //     with (field) {
        //         if (!(/^(0|[1-9]\d{0,2})$/.test(value))) {//
        //             alert(alerttxt);
        //             return false;
        //
        //         }
        //         else {return true;}
        //     }
        // }
        // // function validate_number(field,alerttxt)
        // // {
        // //     with (field)
        // //     {
        // //         if(!(/^d{1,11}$/.test(value)))
        // //         {
        // //             return true;
        // //         }
        // //         else{
        // //             alert(alerttxt);
        // //             return true;}
        // //     }
        // // }
        //
        // //检验不为空
        // function validate_required(field,alerttxt)
        // {
        //     with (field)
        //     {
        //         if (value==null||value=="")
        //         {
        //             alert(alerttxt);
        //             return false;
        //         }
        //         else {return true;}
        //     }
        // }
        //
        //
