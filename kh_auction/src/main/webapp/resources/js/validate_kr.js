
$(document).ready(function() {

    // ID�ߺ��˻�
    $("#idcheck").click(function() {
     if ($.trim($("#id").val()) == "") {
      alert("ID�� �Է��ϼ���");
      $("#id").focus();
      return false;
     } else {
      var ref = "idcheck.jsp?id=" + $("#id").val();
       window.open(ref, "idcheck", "width=350,height=200");
     }
    });
    
    
    // �����ȣ �˻� ��ư Ŭ��
    $("#postcode").click(function(){    
     window.open("post.jsp","post","width=400,height=500,scrollbars=yes");
    });    
    
    // ������ ���� �κ�
    $("#sel").change(function(){
     if($("#sel").val() == ""){ //���� ������ ���
        $("#domain").val("").focus();
        $("#domain").attr("disabled",false); // Ȱ��ȭ
     }else{   //������ ������ ���
        $("#domain").val($("#sel").val());
        $("#domain").attr("disabled","disabled"); //��Ȱ��ȭ
     }     
    });
    
    // �ֹι�ȣ ���ڸ� ��Ŀ�� �̵�
    $("#jumin1").keyup(function(){
     if($("#jumin1").val().length == 6){
    	 
    	 //�������� �˻�
    	 if ($.isNumeric($("#jumin1").val()))
    			 $("#jumin2").focus();
    	 else
    	 { alert("���ڸ� �Է��ϼ���");
    	         $("#jumin1").val('');
    	         $("#jumin1").focus();}
     }
    });   
    
    $("#jumin2").keyup(function(){
        if($("#jumin2").val().length == 7){
       	 
       	 if (!$.isNumeric($("#jumin2").val()))
       		{	
       		 alert("���ڸ� �Է��ϼ���");
       	         $("#jumin2").val('');
       	         $("#jumin2").focus();
       		} 
        }
       });   
    
    
    // ȸ������ ��ư Ŭ���� �� �̺�Ʈ �κ�
    $("form").submit(function() {
       if ($.trim($("#id").val()) == "") {
        alert("ID�� �Է��ϼ���");
        $("#id").focus();
        return false;
       }
       if ($.trim($("#pass").val()) == "") {
        alert("��й�ȣ�� �Է��ϼ���");
        $("#pass").focus();
        return false;
       }
       if ($.trim($("#jumin1").val()) == "") {
        alert("�ֹι�ȣ ���ڸ� 6�ڸ��� �Է��ϼ���");
        $("#jumin1").focus();
        return false;
       }
       if ($.trim($("#jumin1").val().length) != 6) {
        alert("�ֹι�ȣ ���ڸ� 6�ڸ��� �Է��ϼ���");
        $("#jumin1").val("");
        $("#jumin1").focus();
        return false;
       }
       if (!$.isNumeric($("#jumin1").val())) {
        alert("���ڸ� �Է� �����մϴ�.");
        $("#jumin1").val("");
        $("#jumin1").focus();
        return false;
       }
       if ($.trim($("#jumin2").val()) == "") {
        alert("�ֹι�ȣ ���ڸ��� �Է��ϼ���");
        $("#jumin2").focus();
        return false;
       }
       if ($.trim($("#jumin2").val().length) != 7) {
        alert("�ֹι�ȣ ���ڸ� 7�ڸ��� �Է��ϼ���.");
        $("#jumin2").val("");
        $("#jumin2").focus();
        return false;
       }
       if (!$.isNumeric($("#jumin2").val())) {
        alert("���ڸ� �Է� �����մϴ�.");
        $("#jumin2").val("");
        $("#jumin2").focus();
        return false;
       }
       if ($.trim($("#email").val()) == "") {
        alert("E-Mail�ּҸ� �Է��ϼ���");
        $("#email").focus();
        return false;
       }
       if ($.trim($("#domain").val()) == "") {
        alert("������ �ּҸ� �Է��ϼ���");
        $("#domain").focus();
        return false;
       }
       
       if ($("#gender1").is(":checked") == false
         && $("#gender2").is(":checked") == false) {
        alert("����, ���� �߿��� �����ϼ���");
        return false;
       }
       
       var cnt = 0;
       /*if ($("#hobby1").is(":checked"))
        cnt++;
       if ($("#hobby2").is(":checked"))
        cnt++;
       if ($("#hobby3").is(":checked"))
        cnt++;
       if ($("#hobby4").is(":checked"))
        cnt++;
       if ($("#hobby5").is(":checked"))
        cnt++;*/
       var count=$("#hobby5").is(":checked").length;
       if (count < 2) {
        alert("��̴� 2�� �̻� �����ϼ���");
        return false;
       }
       if ($.trim($("#post1").val()) == "") {
        alert("�����ȣ�� �Է� �ϼ���");
        $("#post1").focus();
        return false;
       }
       if (!$.isNumeric($("#post1").val())) {
        alert("���ڸ� �Է� �����մϴ�.");
        $("#post1").val("");
        $("#post1").focus();
        return false;
       }
       
       if ($.trim($("#address").val()) == "") {
        alert("�ּҸ� �Է��ϼ���");
        $("#address").focus();
        return false;
       }
       if ($.trim($("#intro").val()) == "") {
        alert("�ڱ� �Ұ��� �Է��ϼ���");
        $("#intro").focus();
        return false;
       }

      });//submit() end

   });//ready() end 

 


 

