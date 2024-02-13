const values = [0, 6, 8, 9];

const search0 = (value: number): number => {
  const list = value.toString().split("").map(Number);
  const number = list.filter((item: number) => {
    if (item == 0) return item;
    else if (item == 6) return item;
    else if (item == 8) return item;
    if (item == 9) return item;
  });

  return number.length;
};
const item = 16892;
console.log(search0(item));
