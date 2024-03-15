# 期末專案：CPU Pipeline實現

## MIPS Pipeline Datapath
![image](https://github.com/Zocke07/Microprocessor-Based-Systems/assets/91361456/fdc8744c-1229-4bb7-a5be-d289271a82ad)


## 類MIPS Pipeline電路圖
![image](https://github.com/Zocke07/Microprocessor-Based-Systems/assets/91361456/eb976460-657d-4ad3-9d69-fb68052a586d)


## 類MIPS R-format指令pipeline流程
參照mips架構，設計出類R-type指令運作流程。
![image](https://github.com/Zocke07/Microprocessor-Based-Systems/assets/91361456/2373713b-67fb-4feb-8c31-fdad7ce37d81)


## 類MIPS Load指令pipeline流程
參照mips架構，設計出Load指令運作流程。
![image](https://github.com/Zocke07/Microprocessor-Based-Systems/assets/91361456/eff2fd1d-b4b8-4bec-8feb-5df5e768a214)


## 類MIPS Move指令pipeline流程
參照mips架構，設計出Move指令運作流程。
![image](https://github.com/Zocke07/Microprocessor-Based-Systems/assets/91361456/637add1b-4249-421f-b3bf-0a8e21764415)


## 類MIPS R-format指令pipeline電路圖
參照mips架構，設計出R-type指令運作流程。
![image](https://github.com/Zocke07/Microprocessor-Based-Systems/assets/91361456/36bc2754-cf3f-4ddc-989b-64fa57baf56a)

參照mips架構，設計出R-type指令運作與hazard detection流程。
![image](https://github.com/Zocke07/Microprocessor-Based-Systems/assets/91361456/848ee30a-bd93-457c-a8ad-f70c1488e2ec)


## Hint
- Pipeline 須包含以下 cycle
  - Instruction Fetch : 解析指令
  - Instruction Decode (register read) : 讀入指令所需暫存器值
  - Execution : ALU運算
  - Write Back : 把運算結果寫回暫存器
- 所需暫存器
  - IF/ID Register
  - ID/EXE Register
  - EXE/WB Register


## Hazard發生狀況
指令(假設r0= 0 , r1= 1 , r2= 2)
- add r0,r1
- sub r0,r2

Register File:
- r0 = 0
- r1 = 1
- r2 = 2

### Clock 1
![image](https://github.com/Zocke07/Microprocessor-Based-Systems/assets/91361456/9041eb18-11a1-4279-bc6d-c3206fb3546c)

### Clock 2
![image](https://github.com/Zocke07/Microprocessor-Based-Systems/assets/91361456/a8812f1d-fe12-41bd-bdd8-60f4da795b93)

### Clock 3
![image](https://github.com/Zocke07/Microprocessor-Based-Systems/assets/91361456/474ab93b-1bb6-4c08-833a-b6f26c04b963)

### Clock 4
![image](https://github.com/Zocke07/Microprocessor-Based-Systems/assets/91361456/db19cd71-c4d4-470b-a76a-b70f48ddfd77)


## 基本功能
基本功能有：LOAD、MOVE、AND、OR、ADD、SUB等六個功能，詳細介紹如下表：
![image](https://github.com/Zocke07/Microprocessor-Based-Systems/assets/91361456/0ac7870e-1f05-4915-92b3-868e518efde7)


## RS、RT概念
RS和RT分別指到要做動作的暫存器(七段顯示器須同步更新)，例如Add R0, R2 就要將RS指到R0，RT則指到R2後，opcode為0010來進行Add的動作。
![image](https://github.com/Zocke07/Microprocessor-Based-Systems/assets/91361456/50785779-695e-4252-859e-f4ced966bb12)


## 專案要求
- 所有功能皆須以pipeline實現才有分數。
- 總共有四個暫存器(R0,R1,R2,R3)，使用RS和RT分別指定要使用的暫存器(七段顯示器須同步更新)。
- 使用七段顯示器顯示 Rs、Rt 以及 Data 的值。
- Load/Move 是必要完成的功能，需實現所有功能本次實驗才有分數。


## 專案要求 ─ 七段顯示器的使用
- 七段顯示器顯示為十六進制，兩顆七段顯示器為一組，範圍為1~FF (超過FF顯示末兩位)。
- 左邊兩組顯示 Rs 及 Rt 兩個暫存器(EX stage階段的Rs & Rt值 )。
- 執行指令時，若暫存器的內容有被改變，則上述兩組七段顯示器須同步更新。
- 七段顯示器的顯示範圍為 0-FF。


## 專案要求 ─ LED 燈的使用
- 在執行各 Cycle 時，須以綠色 LED 燈顯示該 Cycle 是否正在執行。
- 偵測 Data Hazard時，須以紅色 LED 燈顯示是否有 Hazard 產生。


## 按鈕開關的使用(僅供參考)
- 當指撥開關接設定好後，須使用按鈕開關將其輸入，在這裡，指令和暫存器(或Data)的輸入是使用指令時序的方式，也就是說指撥開關設定好後，其運作程序範例如下(使用clock觸發)：
  1. 依照instruction code來判斷，輸入指定暫存器與執行指令，並顯示更新暫存器的數值。
  2. 完整功能表中的 No instruction 功能，指的是此 clock 不再輸入 Instruction 的狀態。
  3. 每按下一個clock，指撥開關就輸入一道指令。


## 指撥開關的使用(完整功能)
指撥開關以 8bits 輸入 Instruction code (4bits為Opcode，2bits 為 Rs, 2bit 為 Rt)，8Bits 指定 Data，說明如下：
![image](https://github.com/Zocke07/Microprocessor-Based-Systems/assets/91361456/19ff8f57-44b5-49d1-8427-f0431b30211d)


## 實驗配分
- 紫色與黃色區塊皆須以pipeline實現，共 50%。
- Hazard 偵測與解決，共 20% ：
  - 偵測 data hazard + 使用NOP解決 10%
  - 使用 forward 解決 hazard 10%
- 完成粉色區塊 20% ：
  - 需使用Lab7的移位除法器實作才給分
- 完成藍色區塊 10% ：
  - 請參照”SRAM記憶體操作”所提之範例Code自行修改。
- 報告 20%


## 進階項目LW記憶體讀取指令建議pipeline流程
LW指令運作流程（lw Rs, Rt），讀取以Rs暫存器的RAM address讀取資料，建議以Rt作為儲存讀取結果目標暫存器。
![image](https://github.com/Zocke07/Microprocessor-Based-Systems/assets/91361456/486d83f5-b8c1-49c4-a174-42f123a4adb6)


## 進階項目SW記憶體讀取指令建議pipeline流程
LW指令運作流程（sw Rs, Rt），將Rt暫存器值寫入Rs指定之記憶體位址SRAM Address。
![image](https://github.com/Zocke07/Microprocessor-Based-Systems/assets/91361456/50c80e97-ba8d-40f1-afaa-70435ebc52f9)


## 指定腳位 – 輸入
![image](https://github.com/Zocke07/Microprocessor-Based-Systems/assets/91361456/954b3853-bff8-408f-a2f3-572deb93e854)


## 指定腳位 – 七段顯示器 Data
![image](https://github.com/Zocke07/Microprocessor-Based-Systems/assets/91361456/9d9b4d6c-cd96-4916-96d8-c2e64423989f)


## 指定腳位 – 七段顯示器 Rs
![image](https://github.com/Zocke07/Microprocessor-Based-Systems/assets/91361456/c46bad08-3552-4918-a820-c8652a23db33)


## 指定腳位 – 七段顯示器 Rt
![image](https://github.com/Zocke07/Microprocessor-Based-Systems/assets/91361456/8bb61907-4f3a-40c3-825f-d67f634e78dc)


## 指定腳位 – LED燈
![image](https://github.com/Zocke07/Microprocessor-Based-Systems/assets/91361456/6e64ba34-a72d-4c7c-a361-67f1f96b9ae8)
