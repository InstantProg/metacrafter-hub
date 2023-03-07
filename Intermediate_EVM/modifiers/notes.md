# Modifier:

- A condition that the user writes ones, that is checked each time a needed function is run.

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/94b60f70-2e03-4e46-8b52-bd1a6f61d474/Untitled.png)

---

- Special underscore inside the modifiers stands for the upcoming code for the other functions it is used. Thus the require statement is always at the top of the functions that have this modifier.

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/c64ec672-9953-4b4c-b26a-7ba22c72d549/Untitled.png)

---

### **Modifier without parameters**

Just like functions, we can have modifiers that don’t pass any parameters or arguments. Below is an example:

```solidity
modifier onlyOwner {
      require(msg.sender == owner);
      _;
```

### **Modifier with parameters**

We can have modifiers that can pass any parameters or arguments. Below is an example:

```solidity
 modifier costs(uint price) {
      if (msg.value >= price) {
         _;
      }
```

---

### Admin:

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/773f1f20-c0dd-4f5b-b9d6-9a562e01b2d5/Untitled.png)

- all good

---

### Not admin:

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/9b6428e7-6c34-4043-8209-7790fbceed03/Untitled.png)