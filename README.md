[[_TOC_]]

# Принципиальная схема взаимодействия:

![image](uploads/ff786e644f2c26569fed6c507abf0337/image.png)

Задатчиком дискретного входа симулируется срабатывание сигнала телесигнализации (сигнал - выключатель включен). Контроллер принимает этот сигнал и активирует дискретный выход (сигнал - сигнальная лампа на шкафу диспетчеризации предупредительно мигает 5 секунд и остается во включенном состоянии). На мнемосхеме Visu+ меняется положение выключателя, и также зажигается сигнальная лампа.

# 1 Этап разработки - подготовка проекта PC WORX

Для возможности связывания сигналов ввода вывода с информационной моделью IEC 61850 необходимо создать проект PC WORX с устройствами AXL F BK SAS и AXC 1050 и модулями AXL F DI8/DO8, и задать им IP-адреса  
![image](uploads/8a1b9a26bec5c9534ff6c6f7279c4e74/image.png)

Для AXL F BK SAS требуется сделать параметризацию шины Axioline  
![image](uploads/4a2782ec12da89c1d9f0d8f9696ac604/image.png)

Для AXC 1050 требуется создать глобальные переменные (в группе **IEC61850**) для принятия в них сигналов из GOOSE сообщений от AXL F BK SAS 
- BK_SAS_Ind1_stVal - Положение выключателя
- BK_SAS_Ind1_t - Положение выключателя (метка времени)  
- GGIO1_SPCSO_stVal - Состояние дискретного выхода (сигнальная лампа) 
 
![image](uploads/bf6bd57e861fa2179da55daaf67bc2f5/image.png)

Важно создавать переменные именно в группе **IEC61850**, потому что поиск переменных для связывания с моделью IEC 61850 по-умолчанию производится в группе с этим названием.  
![image](uploads/4b6e35197b00ba8cc569759c6353c2e6/image.png)

# 2 Этап разработки - конфигурация в PC WORX IED Configurator

В проект добавляются два устройства - AXL F BK SAS и AXC 1050  
![image](uploads/c52e84c961def5f3fc9f8e45a2048897/image.png)

Добавляются модули ввода-вывода AXL F DI8/DO8  
![image](uploads/9bdb815d4460fd164e27360cc466c194/image.png)
![image](uploads/3f4a12a772aafbd42a526e4e086fcf0f/image.png)

Устройствам назначаются IP адреса и связь с проектом PC WORX
![image](uploads/6bafd4ed94e07b58a1b6a357b8f4a99b/image.png)
![image](uploads/bf431db4ebd22b1cdbbc2175a57a77f2/image.png)

Для передачи в GOOSE сообщениях и MMS репортах создается Dataset с двумя сигналами AXL F BK SAS:  
- LDevice1/GGIO1.Ind1.stVal - состояние GGIO1 (Generic Process I/O)
- LDevice1/GGIO1.Ind1.t - метка времени  

![image](uploads/2138de366ba690b2c7e5bc9c9544a272/image.png)

Создаются Goose Control Block и Report Control Block  
Trigger options:
- dchng - data change - репорт будет генерировать при изменении состояния сигнала в нем
- qchng - quality change - репорт будет генерировать при изменении качества сигнала
- gi - general interrogation - по запросу  

Отчет буферизированный - события накапливаются перед отправкой  
Отчет индексированный с 3 копиями - могут подключиться одновременно 3 клиента  
![image](uploads/53e476f890cca63a83ea7f70da5af40f/image.png)

Связь сигнала с модуля AXL F DI8/DO8 с сигналом информационной модели IEC 61850 
![image](uploads/254631cfcb3f3a73e5f2a0ef879fbaa3/image.png)

Контроллер AXC 1050 будет передавать состояние своего выхода для отображения на мнемосхеме SCADA системы, необходимо также создать Dataset
![image](uploads/efc783737755e8195c3340fb81de48bf/image.png)

И Report Control Block (только MMS сообщения для SCADA)
![image](uploads/6bd3e55a12d19a9d99c3b0e5ad69be98/image.png)

# 3 Этап разработки - связывание GOOSE сигналов в SCT Tool
Для связывания сигналов IEC61850 двух и более устройств между собой можно использовать утилиту [SCT Tool](https://www.fh-dortmund.de/de/fb/3/personen/lehr/harnischmacher/SCT.php), либо любую другую аналогичную. Утилита должна добавить сигналы из файла описания одного устройства в файл описания другого устройства, используя атрибут < ExtRef/>

Создание нового проекта подстанции
![image](uploads/5c5ab77874228f713805961570c495e4/image.png)

Импортируется созданный в PC WORX IED Configurator файл .scd
![image](uploads/fd61dc5a21fc6a2d81a941c3838da182/image.png)

В логический узел LLN0 устройства IED_AXC_1050 добавляются входы из устройства IED_BK_SAS
![image](uploads/5c2a7f56fc7d34b5a5a971c049d6ea93/image.png)
![image](uploads/4ac0ad9c90c699d2f26077a7573829a2/image.png)


Для генерации обновленного .scd файла необходимо добавить в проект новую подстанцию
![image](uploads/552a9eb11bcddc2205240f4ea8e4b277/image.png)

Результатом работы программы будет сгенерированный .scd файл
![image](uploads/6fd5342169023fa61eebc837862bff33/image.png)

# 4 Этап разработки - завершение связывания данных в PC WORX IED Configurator

Импортируется SCL файл, созданный в SCT Tool
![image](uploads/0e4f48cb567fe66c8d9b309b5445099f/image.png)

Указанные в файле ExtRef входы доступны для связывания с внутренними переменными контроллера
![image](uploads/2c27c438e9a163acc32a57a1fcb5f6ef/image.png)
![image](uploads/b83787f5585a261a38c8d96432522b3f/image.png)

Необходимо валидировать конфигурацию, после этого она может быть загружена в устройства кнопкой Configure IEDs
![image](uploads/da1c55967c02bbcfd9e30c01b494e219/image.png)

Диагностику и привязку сишналов можно проверить на странице устройства:
http://192.168.1.103/index.html#iomapping.html
![image](uploads/0be623b77d37f14313da2de80788c7ea/image.png)

# 5 Этап разработки - логика обработки GOOSE сигнала в PC WORX

В программе Main исполняется функциональй блок, который по пришедшему от AXL F BK SAS сигнала 5 секунд мигает выходным сигналом дампы, и после этого зажигает ее непрерывно.
Помимо этого включение дискретного выхода транслируется в переменную из группы IEC61850
![image](uploads/93783ad742349441758e4ba99d9a3cec/image.png)

# 6 Этап разработки - мнемосхема SCADA системы

На экране расположены два динамических элемента - мнемосхема с Q1 и панель индикации с лампой  
![image](uploads/7a98c385542424f81fe977540494d6e0/image.png)

В проект добавляется драйвер IEC 61850
![image](uploads/bfad2a3a076e4cbfb4f17e41f3440a91/image.png)

В свойствах драйвера определяются две станции - IED_BK_SAS и IED_AXC_1050
![image](uploads/bc6dc51d28985892857607e1f19e8948/image.png)
![image](uploads/f0dbb523b7d776b96b9b06cb68614435/image.png)

И импортируются теги из .cid файлов
![image](uploads/5d4e158f93fe3ba42dee55581ae3597e/image.png)
![image](uploads/bab1261b0e4a4067f31516de4ffe5508/image.png)

Поскольку используются индексированные отчеты, автоматически импортированное имя RCB1 следует заменить на имя с учетом индекса - RCB101 (или RCB102, или RCB103)
![image](uploads/2fa13b02fc3f267e18ceda0b1085d9ed/image.png)

# Демонстрация в Visu+  

Включение
![image](uploads/cd07f1cc191d222818f2b86d4c24b763/image.png)

Отключение
![image](uploads/47d377c08683e42d5998139494235a20/image.png)

# Демонстрация в OMICRON IED Scout  

Включение  
![image](uploads/43effe799fedef1d3024ffc37a40776f/image.png)

Отключение  
![image](uploads/03da959ab2235cadd37fa5beaf89e8a7/image.png)

