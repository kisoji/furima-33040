const pay = () => {
  
  
  Payjp.setPublicKey(process.env.PAYJP_PUBLIC_KEY);
  const form = document.getElementById("charge-form");
  form.addEventListener("submit", (e) => {
    e.preventDefault();
    
    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);

    const card = {
      number: formData.get("user_order[card-number]"),
      cvc: formData.get("user_order[card-cvc]"),
      exp_month: formData.get("user_order[card-exp-month]"),
      exp_year: `20${formData.get("user_order[card-exp-year]")}`,
    };
  
    Payjp.createToken(card, (status, response) => {
      if (status == 200) {
        const token = response.id;
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} name='token' type="hidden"> `;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
      }
    
      document.getElementById("card-number").removeAttribute("user_order[card-number]");
      document.getElementById("card-cvc").removeAttribute("user_order[card-cvc]");
      document.getElementById("card-exp-month").removeAttribute("user_order[card-exp-month]");
      document.getElementById("card-exp-year").removeAttribute("user_order[card-exp-year]");

      document.getElementById("charge-form").submit();
    });
  });
};

window.addEventListener("load", pay);