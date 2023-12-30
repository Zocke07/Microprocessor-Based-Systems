# 實驗七:八位元除法器


## 狀態機基本概念(Cont.)

- 演算式狀態機器:
  - 主要是利用狀態機器如人類處理事務的流程之概念,利用流程圖將之狀態流程繪出,即稱之『演算式狀態機器』。
- 符號說明:
  - 狀態符號:用來說明穩定後狀態的名稱及狀態編碼。如果是Moore Machine時 在狀態穩定時,它的輸出值則寫在方格內(狀態輸出列的地方)。進入或離開狀態 是以箭號導引決策、條件。
  - 敘述符號:用來描寫依條件不同而有不同的狀態轉移,也就是條件符合則走 T 的路徑離開,否則走 F 路線離開。條件輸出:主要用於Mealy Machine的輸出。 在狀態改變時輸出。

![image](https://github.com/Zocke07/Microprocessor-Based-Systems/assets/91361456/89cbf837-8ceb-45b4-9dcb-bed5ba8ab052)


##  除法器 – 狀態圖

![image](https://github.com/Zocke07/Microprocessor-Based-Systems/assets/91361456/eae99120-1669-4f0e-811e-7b90709448c0)
> 狀態圖


## 除法器 – 狀態圖目前狀態與輸入表

![image](https://github.com/Zocke07/Microprocessor-Based-Systems/assets/91361456/25676f0f-f18b-42e9-a6d6-f94a33670ada)


## 八位元除法器 - 硬體架構 - 初始狀態

![image](https://github.com/Zocke07/Microprocessor-Based-Systems/assets/91361456/2ec90f20-2dc7-4a80-b793-9770003bbc38)
> 圖三，硬體架構圖


## 八位元除法器 - 硬體架構 -運算過程及結果

![image](https://github.com/Zocke07/Microprocessor-Based-Systems/assets/91361456/c5144ca6-a205-4a67-b31c-2432c707ee15)
> 圖四，硬體架構圖

![image](https://github.com/Zocke07/Microprocessor-Based-Systems/assets/91361456/f3962712-a5e3-46ae-b2ff-9f609071a474)


## 除法器流程圖

![image](https://github.com/Zocke07/Microprocessor-Based-Systems/assets/91361456/b87e97b6-5b00-4fc5-bea2-acd0598904f3)


## ENTITY
```
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY Divider IS
  PORT( clk, clear : IN STD_LOGIC;
        Divisor, Dividend : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
        Remainder : BUFFER STD_LOGIC_VECTOR(16 DOWNTO 0)
      );
END Divider

ARCHITECTURE logicfunc OF Divider IS
  SIGNAL w : STD_LOGIC;
BEGIN



END logicfunc;
```


## 實驗目標 八位元除法器
- 請設計出一個可進行觸發的除法運算的電路系統
- 必須透過移位暫存器配合實驗六運算方式,實現電路架構圖完成本次實驗。
- 測試時,以按鈕改變clock觸發事件進行運算並顯示結果。
- 除數與被除數輸入範圍為1-255,需顯示除法運算後的商與餘數結果。


## 實驗要求及配分
- 可使用GENERIC以及PROCESS內之FOR LOOP
- 需使用實驗五的多用途移位暫存器
- 完成 8 位元除法器可得 70%
  - 正確顯示“商”(Quotient)跟“餘”(Remainder)之結果於LED上
  - 並在完成計算時(狀態機到達S4),以16進制正確顯示“商”(Quotient)跟“餘”(Remainder)之結果於七段顯示器上
- 實驗報告 30%


## 指定腳位 – 輸入

![image](https://github.com/Zocke07/Microprocessor-Based-Systems/assets/91361456/b445a53f-26b7-4089-97f2-732a6a2a04c6)


## 指定腳位 – LED 輸出

![image](https://github.com/Zocke07/Microprocessor-Based-Systems/assets/91361456/8541378d-ab87-41ae-8b00-c8f6b9ac0361)


## 指定腳位 –七段顯示器輸出

![image](https://github.com/Zocke07/Microprocessor-Based-Systems/assets/91361456/88078b2a-b9c3-4418-bc79-76df76d74fa0)

![image](https://github.com/Zocke07/Microprocessor-Based-Systems/assets/91361456/b460ac35-4168-4cbe-8c79-3a10b3ea956b)

