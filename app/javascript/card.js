const pay = () => {
  if (document.getElementById("mailing-button")){
    Payjp.setPublicKey(process.env.PAYJP_PUBLIC_KEY);
    const submit = document.getElementById("mailing-button");
    submit.addEventListener("click", (e) => {
      e.preventDefault();
      
      const formResult = document.getElementById("charge-form");
      const formData = new FormData(formResult);

      const card = {
        number: formData.get("order_mailing[number]"),
        exp_month: formData.get("order_mailing[exp_month]"),
        exp_year: `20${formData.get("order_mailing[exp_year]")}`,
        cvc: formData.get("order_mailing[cvc]"),
      };

      Payjp.createToken(card, (status, response) => {
        if (status == 200) {
          const token = response.id;
          const renderDom = document.getElementById("charge-form");
          const tokenObj = `<input value=${token} name='token' type="hidden">`;
          renderDom.insertAdjacentHTML("beforeend", tokenObj);
        }

        document.getElementById("order_mailing_number").removeAttribute("name");
        document.getElementById("order_mailing_exp_month").removeAttribute("name");
        document.getElementById("order_mailing_exp_year").removeAttribute("name");
        document.getElementById("order_mailing_cvc").removeAttribute("name");

        document.getElementById("charge-form").submit();
      });
    });
  }
};

window.addEventListener("load", pay);