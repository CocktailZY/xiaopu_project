//删除多条记录时，检查是否有记录被选中，没有返回，有的话向后台提交数据
function checkzero(formvalue)
{	
	var count=0;
	var arr = document.getElementsByName(formvalue);
    for ( var i = 0; i < arr.length; i++) 
    {
        if (arr.item(i).checked == true) 
        {
        	count++;
        }            
    }
    if(count==0)
    {
    	alert("所选记录数量为零，请重新选择！！");
     		return false;
 
    }
    else
    {
    	if(confirm("确认删除所选记录吗？\n记录删除后将不能被恢复！！！"))
    	{
			document.forms[0].submit(); 
    		return true;
   	}
    	else
    	{
    		return false;
    	}        	
    }
}

//全选或者全不选
function checkAll(formvalue) {
    var all=document.getElementById(formvalue+"All");       
    if(all.checked)
    {
    	var arr = document.getElementsByName(formvalue);
        for ( var i = 0; i < arr.length; i++) {
            if (arr.item(i).checked == false) {
            	arr.item(i).checked = true;
            }
        }
    }
    else
    {
    	var arr = document.getElementsByName(formvalue);
        for ( var i = 0; i < arr.length; i++) {
            if (arr.item(i).checked == true) {
            	arr.item(i).checked = false;
            }
        }
    }
}
//如果记录前面的的复选框有一个 未被选中，那么标题栏的复选框就处于未选中状态
//如果所有记录前面的复选框都被选中了，那么标题栏的复选框就处于选中状态
function unCheckAll(formvalue)
{	
	var flag=true;
	var arr = document.getElementsByName(formvalue);    	
    for ( var i = 0; i < arr.length; i++) {
         if (arr.item(i).checked == false) {
             flag=false;	
             break;             
         }
    }
    if(flag==false)
    {
    	
    	document.getElementById(formvalue+"All").checked=false;
    }
    else
    {
    	
    	document.getElementById(formvalue+"All").checked=true;	    	
    }
}
//单个删除确认
function delcfm() {
	var msg = "确定要删除该条记录吗？删除之后数据将不能恢复！！！\n\n请确认！"; 
	if (confirm(msg)==true){ 
		return true; 
	}else{ 
		return false; 
	} 
} 


