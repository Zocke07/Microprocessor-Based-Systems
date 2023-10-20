# 實驗三：BCD加法器電路設計  

## 基本概念：階層化的設計概念
- 上層電路是由下層電路所合成，而本實習以實現一個 BCD 加法 器，呈現電路階層化設計的概念，並以兩顆 7-Segment 七段顯示 器顯示 0~99 相加之結果。
- 設計由上而下，實現電路由下而上。
![螢幕擷取畫面 2023-10-20 222121](https://github.com/Zocke07/Microprocessor-Based-Systems/assets/91361456/66190b4c-f67a-491e-82b9-509c67c51bc3)

## BCD加法器之系統架構  
- A1-A4 與 B1-B4 相加若 S1-S4 是否超過 1001（9）時則必須由 『判斷電路』判斷。
- 而超過 9 再利用『修正電路』作修正其『和』及產生『進位輸出』
![image](https://github.com/Zocke07/Microprocessor-Based-Systems/assets/91361456/7edd8d12-89ca-4321-8dbc-9faba3f36611)

## BCD加法器之電路
- 加法進位的條件：
  - 8 + 4 > 9 => 進位。
  - 8 + 2 > 9 => 進位。
- BCD加法器進位條件：
  - S3’ AND S2’ 是 1 就進位。
  - S3’ AND S1’ 是 1 就進位。
- CN 代表是否進位 (Carry)。
  - 若有進位 (CN =1)，要在最終結果再加一個 0110 的值轉為 Decimal。

![螢幕擷取畫面 2023-10-20 222459](https://github.com/Zocke07/Microprocessor-Based-Systems/assets/91361456/0efa411a-d3a8-4c6a-87a0-c8de04888b17)

## 4bit - BCD加法器之電路  
![螢幕擷取畫面 2023-10-20 222543](https://github.com/Zocke07/Microprocessor-Based-Systems/assets/91361456/6b27e4ef-5e32-4d01-96b5-211b29060573)  

## VHDL code 撰寫與實現  
完成 BCD 加法器電路後，以階層化設計整合上次實驗一所實作 之 7-Segment 七段顯示器電路之 VHDL 實作檔，再以 Package 與 component 語法包裝並整合入 BCD 加法器電路中，而且在實驗板 上面以點亮兩顆七段顯示器驗證 BCD 加法電路是否正確。  

## VHDL code
```
library ieee;
use ieee.std_logic_1164.all;
use work.LAB03_package.all;
…
entity LAB03 is
  port( A : in std_logic_vector(0 to 7);
    B : in std_logic_vector(0 to 7);
    a0, b0, c0, d0, e0, f0, g0 : out std_logic;
    a1, b1, c1, d1, e1, f1, g1 : out std_logic;
    overflow : out std_logic);
end LAB03;
architecture structure of LAB03 is
  signal c : std_logic_vector(1 to 8);
  …
Begin
  …
end structure;
```

## 包裝 Component 的範例
```
library ieee;
use ieee.std_logic_1164.all;
package LAB03_package is
component fulladd
  port( Cin, x, y : in std_logic;
    s, Cout : out std_logic);
end component fulladd;
component hex
  port( w, x, y, z : in std_logic;
    a, b, c, d, e, f, g : out std_logic);
end component hex;
…
end LAB03_package;
```

## 實驗目標: 8位元 BCD加法器  
1. 以1bit全加器為基礎，將上述之 BCD 加法器邏輯函數<b>以 Package 與 component 語法包裝</b>，並以實驗板上面兩顆七段顯示器驗證 BCD 加法電路是否正確。
2. 測試時，將以指撥開關輸入要相加的數字，而兩顆七段顯示器上必須可正確顯 示出 <b>BCD 十進位加法運算</b>之結果。
3. 本次實驗，需使用A0~A7與B0~B7各表示以BCD編碼的兩個十進位數，其中 A7~A4四個bit表示0~9(十位數)、A3~A0四個bit表示0~9(個位數)，B0~B3、 B4~B7亦同，完成兩個十進位正整數的相加，結果亦為正整數，範圍為 0~99。
4. 禁用IF和SWITCH語法，請以加法器(邏輯閘)方式實現，使用其他方式則酌以扣分。

## 指定腳位  
下表僅為範例, 可自行選擇腳位  
![螢幕擷取畫面 2023-10-20 222945](https://github.com/Zocke07/Microprocessor-Based-Systems/assets/91361456/fc91a65e-4e04-496a-8ea4-e744fd416036)
