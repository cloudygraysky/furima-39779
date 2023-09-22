const itemprice = () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = Math.floor(priceInput.value * 0.1);

    const addProfitDom = document.getElementById("profit");
    addProfitDom.innerHTML = Math.floor(priceInput.value - (priceInput.value * 0.1));
  });
}
window.addEventListener("turbo:load", itemprice);
window.addEventListener("turbo:render", itemprice);