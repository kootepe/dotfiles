count = float(input("How many pizzas? "))
water = float(input("How wet dough? 0-100% "))
while water > 100 or water < 50:
    water = int(input("How wet dough? 50-100% "))


flour = int(round(count * 200, 0))
water = int(round(flour * (water / 100), 0))
salt = int(round(flour * 0.02, 0))
oil = int(round(flour * 0.05, 0))

print(f"Flour: {flour}g\nWater: {water}g\nSalt: {salt}g\nOlive oil: {oil}g, optional")
