# 實驗六:移位除法器之狀態機  

## 狀態機基本概念(Cont.)  
![image](https://github.com/Zocke07/Microprocessor-Based-Systems/assets/91361456/18c15e75-9c9c-4c83-b3b7-957556879ff4)  

## 實驗目標 基本FSM狀態機  
- 如圖四，請設計出一個基於除法器狀態,並以clock進行可觸發的六個狀態之狀態機。
- 必須透過TYPE設定State_type進行狀態切換來實現,完成本實驗目標。
- 狀態機使用Mealy或Moore狀態機皆可。
- 測試時，以按鈕改變clock觸發事件並以ω(output function)來切換輸入 信號。
- 輸出需以3bit 顯示現在狀態。
- 本次實驗為除法器流程之狀態機架構實作。
- 目的在於用狀態機的方式讓同學們了解除法器的條件判斷流程與實行方法。

![image](https://github.com/Zocke07/Microprocessor-Based-Systems/assets/91361456/9a596d40-d92a-4a37-a58c-a50464c19789)  

![image](https://github.com/Zocke07/Microprocessor-Based-Systems/assets/91361456/e9581c6e-ccc5-4759-a558-63daa7f5a9e9)  

## 除法器 – 狀態圖  
![image](https://github.com/Zocke07/Microprocessor-Based-Systems/assets/91361456/de22760c-7480-4be7-b068-be74f0a60491)  
> 圖四，狀態圖

## 實驗要求及配分  
- 可使用GENERIC以及PROCESS內之FOR LOOP
- 完成 FSM 狀態機可得 70% (顯示結果於LED上)
- 實驗報告 30%

## 除法器 – 狀態圖目前狀態與輸入表  
![image](https://github.com/Zocke07/Microprocessor-Based-Systems/assets/91361456/a2cd9a3e-d03b-41e2-8351-c141a37613f5)  

## ENTITY  
```
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
entity FSM is
  port(
    clk, reset, w : in std_logic;
    output : out std_logic_vector(2 downto 0);
  );
end;

architecture LogicFunc of FSM is

begin

end;
```

## 指定腳位
![image](https://github.com/Zocke07/Microprocessor-Based-Systems/assets/91361456/4816fc68-ea8a-401e-8dce-ad5f125ebf60)
