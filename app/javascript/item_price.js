window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  const addTaxDom = document.getElementById("add-tax-price")
  const addProfit = document.getElementById("profit")
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    addTaxDom.innerHTML = (Math.floor(inputValue * 0.1)).toLocaleString();
    const addTaxDomCal = Math.floor(inputValue * 0.1);
    addProfit.innerHTML = (Math.floor(inputValue - addTaxDomCal)).toLocaleString();
    console.log(addProfit)
  })
})