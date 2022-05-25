$(function(){
    const wrapper = $(".wrapper");
    const wrapper1 = $(".wrapper1");
    const myBtn = $(".mypage");
    const selBtn = $(".sellerpage");
    const mypage1 = $(".mypage1");
    const sellerpage1 = $(".sellerpage1");
    wrapper1.hide();
    myBtn.on("click",function(){
        wrapper.show();
        wrapper1.hide();
        
        
    });
    selBtn.on("click",function(){
        wrapper.hide();
        wrapper1.show();
        
        
    });
    const funding=$(".funding");
    const store = $(".store");
    const fund= $(".fund");
    const storeCt=$(".storeCt");
    const notthingF = $(".notthingF");
    notthingF.hide();
    funding.on("click",function(){
        fund.show();
        storeCt.hide();
        $(this).addClass("cc");
        store.removeClass("cc");
    });
    store.on("click",function(){
        fund.hide();
        storeCt.show();
        $(this).addClass("cc");
        funding.removeClass("cc");
    });
    funding.click();
    
});