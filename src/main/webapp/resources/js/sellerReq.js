


$(function(){
    const checkArr= [false,false];
    const enIntro = $("[name=enIntro]");
    const regIntro =/^[^#]{1,100}$/;
    
    
    enIntro.on("change",function(){
        if(!regIntro.test(enIntro.val())){
            
            $(this).next().text("100자 이내로 작성해주세요");
            $(this).next().css({
                "color" : "red",
                "font-size" : "6px"
            });
            $(this).removeClass();
            $(this).addClass("form-control is-invalid");
        }else{
            $(this).next().text("");
            $(this).removeClass();
            $(this).addClass("form-control is-valid");
        }
    });

    const enNo = $("[name=enNo]");
    const regNo = /^[0-9-]{1,14}$/;
    enNo.on("change",function(){
        console.log(enNo.val());
        if(!regNo.test(enNo.val())){
            $(this).removeClass();
            $(this).addClass("form-control is-invalid")
            $(this).next().text("숫자나 - 기호만 입력하세요");
            $(this).next().css({
                "color" : "red",
                "font-size" : "6px"
            });
            checkArr[0] = false;
        }else{
            $(this).next().text("");
            $(this).removeClass();
            $(this).addClass("form-control is-valid");
            checkArr[0] = true;
        }
    });
    const name = $("[name=owner]");
    const nameReg =/^[가-힣a-zA-Z]+$/;
    name.on("change",function(){
        if(!nameReg.test(name.val())){
            name.removeClass();
            name.addClass("form-control is-invalid");
            name.next().text("한글, 영어만 입력 가능합니다.");
            name.next().css({
                "color" : "red",
                "font-size" : "6px"
            })
            checkArr[1]=false;
        }else{
            checkArr[1]=true;
            name.next().text("");
            name.removeClass();
            name.addClass("form-control is-valid");
            
        }
    });
    
    const btn = $(".signupb");
    btn.on("click",function(e){
        if(checkArr[0]&&checkArr[1]){

        }else{
            e.preventDefault();
            $(this).next().text("입력값이 잘못되어 요청처리되지 않았습니다");
            $(this).next().css({
                "font-size" : "6px",
                "color" :"red",
                "margin-top" : "5px"
            });
        }
    });
});