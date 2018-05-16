<?xml version="1.0" encoding="utf-8"?>
<SCL xmlns="http://www.iec.ch/61850/2003/SCL" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema">
  <Header id="demo_61850" version="1" toolID="SCT" />
  <Substation name="demo_61850">
    <VoltageLevel name="Voltagelevel1">
      <Bay name="SwitchBay1" />
    </VoltageLevel>
  </Substation>
  <Communication>
    <SubNetwork name="SubNetwork1">
      <ConnectedAP iedName="IED_BK_SAS" apName="AP1">
        <Address>
          <P xsi:type="tP_IP" type="IP">192.168.1.103</P>
          <P xsi:type="tP_IP-SUBNET" type="IP-SUBNET">255.255.255.0</P>
          <P xsi:type="tP_IP-GATEWAY" type="IP-GATEWAY">0.0.0.0</P>
          <P xsi:type="tP_OSI-PSEL" type="OSI-PSEL">00000001</P>
          <P xsi:type="tP_OSI-SSEL" type="OSI-SSEL">0001</P>
          <P xsi:type="tP_OSI-TSEL" type="OSI-TSEL">0001</P>
        </Address>
        <GSE ldInst="LDevice1" cbName="GCB1">
          <Address>
            <P xsi:type="tP_MAC-Address" type="MAC-Address">01-0C-CD-01-00-00</P>
          </Address>
          <MinTime unit="s" multiplier="m">10</MinTime>
          <MaxTime unit="s" multiplier="m">1000</MaxTime>
        </GSE>
      </ConnectedAP>
      <ConnectedAP iedName="IED_AXC_1050" apName="AP1">
        <Address>
          <P xsi:type="tP_IP" type="IP">192.168.1.102</P>
          <P xsi:type="tP_IP-SUBNET" type="IP-SUBNET">255.255.255.0</P>
          <P xsi:type="tP_IP-GATEWAY" type="IP-GATEWAY">0.0.0.0</P>
          <P xsi:type="tP_OSI-PSEL" type="OSI-PSEL">00000001</P>
          <P xsi:type="tP_OSI-SSEL" type="OSI-SSEL">0001</P>
          <P xsi:type="tP_OSI-TSEL" type="OSI-TSEL">0001</P>
        </Address>
      </ConnectedAP>
    </SubNetwork>
  </Communication>
  <IED name="IED_BK_SAS" type="AXL F" manufacturer="PHOENIX CONTACT GmbH &amp; Co. KG">
    <Private type="PxC.IEC61850.Engineering.DATA.SCL.Privates.tPrivateIEDInfo">
      <IEDInfo type="AXL F BK SAS" hwRevision="2007" swRevision="FW 1.30" xmlns="http://www.phoenixcontact.com/iec61850/scl/engineering/private" />
    </Private>
    <Private type="PxC.IEC61850.Engineering.DATA.SCL.Privates.tPrivateIEDConfigurationInfo">
      <IEDConfigurationInfo xmlns="http://www.phoenixcontact.com/iec61850/scl/engineering/private" />
    </Private>
    <Private type="PxC.IEC61850.Engineering.DATA.SCL.Privates.tPrivateStartupParameter">
      <StartupParameter xmlns="http://www.phoenixcontact.com/iec61850/scl/engineering/private">
        <ReportScanRate>0</ReportScanRate>
        <LocalBusErrorBehaviour>false</LocalBusErrorBehaviour>
        <LogMaxEntries>0</LogMaxEntries>
        <PerformanceProfile>0</PerformanceProfile>
        <AlarmContactCfg>0</AlarmContactCfg>
      </StartupParameter>
    </Private>
    <Private type="PxC.IEC61850.Engineering.DATA.SCL.Privates.tPrivateApplicationInfo">
      <ApplicationInfo src="C:\dev\demo_61850\PCWORX\bin\demo_61850\CntrlBrd_24\_s49AXL" xmlns="http://www.phoenixcontact.com/iec61850/scl/engineering/private" />
    </Private>
    <Services>
      <DynAssociation />
      <GetDirectory />
      <GetDataObjectDefinition />
      <GetDataSetValue />
      <DataSetDirectory />
      <ConfDataSet max="4" maxAttributes="50" />
      <ReadWrite />
      <ConfReportControl max="4" />
      <GetCBValues />
      <ConfLogControl max="1" />
      <ReportSettings cbName="Conf" datSet="Conf" rptID="Dyn" optFields="Conf" bufTime="Dyn" intgPd="Dyn" />
      <GSESettings cbName="Conf" datSet="Conf" appID="Conf" />
      <GOOSE max="4" />
      <FileHandling />
      <ConfLNs fixLnInst="true" />
      <ClientServices bufReport="true" unbufReport="true" />
    </Services>
    <AccessPoint name="AP1">
      <Private type="PxC.IEC61850.Engineering.DATA.SCL.Privates.tPrivateAccessPointInfo">
        <AccessPointInfo isActive="true" xmlns="http://www.phoenixcontact.com/iec61850/scl/engineering/private" />
      </Private>
      <Server desc="Server">
        <Authentication />
        <LDevice inst="LDevice1">
          <LN0 lnType="PxC.Rev2007.LLN0" lnClass="LLN0" inst="">
            <DataSet name="Dataset1">
              <FCDA ldInst="LDevice1" lnClass="GGIO" lnInst="1" doName="Ind1" daName="stVal" fc="ST" />
              <FCDA ldInst="LDevice1" lnClass="GGIO" lnInst="1" doName="Ind1" daName="t" fc="ST" />
            </DataSet>
            <ReportControl name="RCB1" datSet="Dataset1" rptID="IED_BK_SASLDevice1/LLN0.RCB1" confRev="1" buffered="true">
              <TrgOps dchg="true" qchg="true" />
              <OptFields />
              <RptEnabled max="3" />
            </ReportControl>
            <GSEControl name="GCB1" datSet="Dataset1" confRev="1" appID="IED_BK_SASLDevice1/LLN0.GCB1" />
          </LN0>
          <LN lnType="PxC.Rev2007.LPHD" lnClass="LPHD" inst="1" />
          <LN lnType="PxC.Rev2007.GGIO.DIO8" lnClass="GGIO" inst="1">
            <DOI name="Ind1">
              <DAI name="stVal">
                <Private type="PxC.IEC61850.Engineering.DATA.SCL.Privates.tPrivateMapping">
                  <Mapping xmlns="http://www.phoenixcontact.com/iec61850/scl/engineering/private">
                    <MappingItem>
                      <Link direction="IN">
                        <BKLink processDataDescriptionType="DI" moduleNumber="1" channelGroup="1" channelNumber="1" />
                      </Link>
                    </MappingItem>
                  </Mapping>
                </Private>
              </DAI>
            </DOI>
          </LN>
        </LDevice>
      </Server>
    </AccessPoint>
  </IED>
  <IED name="IED_AXC_1050" type="AXC" manufacturer="PHOENIX CONTACT GmbH &amp; Co. KG">
    <Private type="PxC.IEC61850.Engineering.DATA.SCL.Privates.tPrivateIEDInfo">
      <IEDInfo type="AXC 1050" hwRevision="2007" swRevision="FW 3.00" xmlns="http://www.phoenixcontact.com/iec61850/scl/engineering/private" />
    </Private>
    <Private type="PxC.IEC61850.Engineering.DATA.SCL.Privates.tPrivateIEDConfigurationInfo">
      <IEDConfigurationInfo xmlns="http://www.phoenixcontact.com/iec61850/scl/engineering/private" />
    </Private>
    <Private type="PxC.IEC61850.Engineering.DATA.SCL.Privates.tPrivateStartupParameter">
      <StartupParameter xmlns="http://www.phoenixcontact.com/iec61850/scl/engineering/private">
        <ReportScanRate>0</ReportScanRate>
        <LocalBusErrorBehaviour>false</LocalBusErrorBehaviour>
        <LogMaxEntries>0</LogMaxEntries>
        <PerformanceProfile>0</PerformanceProfile>
        <AlarmContactCfg>0</AlarmContactCfg>
      </StartupParameter>
    </Private>
    <Private type="PxC.IEC61850.Engineering.DATA.SCL.Privates.tPrivateApplicationInfo">
      <ApplicationInfo src="C:\dev\demo_61850\PCWORX\bin\demo_61850\C\STD_CNF\R\STD_RES" xmlns="http://www.phoenixcontact.com/iec61850/scl/engineering/private" />
    </Private>
    <Services>
      <DynAssociation />
      <GetDirectory />
      <GetDataObjectDefinition />
      <GetDataSetValue />
      <DataSetDirectory />
      <ConfDataSet max="4" maxAttributes="50" />
      <ReadWrite />
      <ConfReportControl max="4" />
      <GetCBValues />
      <ConfLogControl max="1" />
      <ReportSettings cbName="Conf" datSet="Conf" rptID="Dyn" optFields="Conf" bufTime="Dyn" intgPd="Dyn" />
      <GSESettings cbName="Conf" datSet="Conf" appID="Conf" />
      <GOOSE max="4" />
      <FileHandling />
      <ConfLNs fixLnInst="true" />
      <ClientServices bufReport="true" unbufReport="true" />
    </Services>
    <AccessPoint name="AP1">
      <Private type="PxC.IEC61850.Engineering.DATA.SCL.Privates.tPrivateAccessPointInfo">
        <AccessPointInfo isActive="true" xmlns="http://www.phoenixcontact.com/iec61850/scl/engineering/private" />
      </Private>
      <Server desc="Server">
        <Authentication />
        <LDevice inst="LDevice1">
          <LN0 lnType="PxC.Rev2007.LLN0" lnClass="LLN0" inst="">
            <Inputs>
              <ExtRef iedName="IED_BK_SAS" ldInst="LDevice1" lnClass="GGIO" lnInst="1" doName="Ind1" daName="stVal" />
              <ExtRef iedName="IED_BK_SAS" ldInst="LDevice1" lnClass="GGIO" lnInst="1" doName="Ind1" daName="t" />
            </Inputs>
          </LN0>
          <LN lnType="PxC.Rev2007.LPHD" lnClass="LPHD" inst="1" />
          <LN lnType="PxC.Rev2007.GGIO.DIO8" lnClass="GGIO" inst="1" />
        </LDevice>
      </Server>
    </AccessPoint>
  </IED>
  <DataTypeTemplates>
    <LNodeType id="PxC.Rev2007.LLN0" desc="Logical Node Zero" lnClass="LLN0">
      <DO name="Beh" type="PxC.Rev2007.ENS.Beh" />
      <DO name="Health" type="PxC.Rev2007.ENS.Health" />
      <DO name="NamPlt" type="PxC.Rev2007.LPL.LLN0" />
      <DO desc="Mode" name="Mod" type="PxC.Rev2007.ENC.Mod.Status" />
    </LNodeType>
    <LNodeType id="PxC.Rev2007.LPHD" desc="Physical Device Information" lnClass="LPHD">
      <DO name="PhyNam" type="PxC.Rev2007.DPL" />
      <DO name="PhyHealth" type="PxC.Rev2007.ENS.Health" />
      <DO name="Proxy" type="PxC.Rev2007.SPS" />
      <DO desc="Mode" name="Mod" type="PxC.Rev2007.ENC.Mod.Status" />
    </LNodeType>
    <LNodeType id="PxC.Rev2007.GGIO.DIO8" desc="Generic Process I/O" lnClass="GGIO">
      <DO name="Beh" type="PxC.Rev2007.ENS.Beh" />
      <DO name="Health" type="PxC.Rev2007.ENS.Health" />
      <DO name="NamPlt" type="PxC.Rev2007.LPL" />
      <DO desc="External equipment health (external sensor)" name="EEHealth" type="PxC.Rev2007.ENS.Health" />
      <DO desc="External equipment name plate" name="EEName" type="PxC.Rev2007.DPL" />
      <DO name="SPCSO1" type="PxC.Rev2007.SPC.Direct" />
      <DO name="SPCSO2" type="PxC.Rev2007.SPC.Direct" />
      <DO name="SPCSO3" type="PxC.Rev2007.SPC.Direct" />
      <DO name="SPCSO4" type="PxC.Rev2007.SPC.Direct" />
      <DO name="SPCSO5" type="PxC.Rev2007.SPC.Direct" />
      <DO name="SPCSO6" type="PxC.Rev2007.SPC.Direct" />
      <DO name="SPCSO7" type="PxC.Rev2007.SPC.Direct" />
      <DO name="SPCSO8" type="PxC.Rev2007.SPC.Direct" />
      <DO name="Ind1" type="PxC.Rev2007.SPS" />
      <DO name="Ind2" type="PxC.Rev2007.SPS" />
      <DO name="Ind3" type="PxC.Rev2007.SPS" />
      <DO name="Ind4" type="PxC.Rev2007.SPS" />
      <DO name="Ind5" type="PxC.Rev2007.SPS" />
      <DO name="Ind6" type="PxC.Rev2007.SPS" />
      <DO name="Ind7" type="PxC.Rev2007.SPS" />
      <DO name="Ind8" type="PxC.Rev2007.SPS" />
      <DO desc="Mode" name="Mod" type="PxC.Rev2007.ENC.Mod.Status" />
    </LNodeType>
    <DOType id="PxC.Rev2007.ENS.Beh" desc="Enumerated status" cdc="ENS">
      <DA name="stVal" bType="Enum" type="Beh" dchg="true" dupd="true" fc="ST" />
      <DA name="q" bType="Quality" qchg="true" fc="ST" />
      <DA name="t" bType="Timestamp" fc="ST" />
    </DOType>
    <DOType id="PxC.Rev2007.ENS.Health" desc="Enumerated status" cdc="ENS">
      <DA name="stVal" bType="Enum" type="Health" dchg="true" dupd="true" fc="ST" />
      <DA name="q" bType="Quality" qchg="true" fc="ST" />
      <DA name="t" bType="Timestamp" fc="ST" />
    </DOType>
    <DOType id="PxC.Rev2007.LPL.LLN0" desc="Logical Node Name Plate" cdc="LPL">
      <DA name="vendor" bType="VisString255" fc="DC" />
      <DA name="swRev" bType="VisString255" fc="DC" />
      <DA name="d" bType="VisString255" fc="DC" />
      <DA name="configRev" bType="VisString255" fc="DC" />
      <DA name="ldNs" bType="VisString255" fc="EX" />
    </DOType>
    <DOType id="PxC.Rev2007.ENC.Mod.Status" desc="Controllable enumerated status" cdc="ENC">
      <DA name="stVal" bType="Enum" type="Mod" dchg="true" fc="ST">
        <Val>on</Val>
      </DA>
      <DA name="q" bType="Quality" qchg="true" fc="ST" />
      <DA name="t" bType="Timestamp" fc="ST" />
      <DA name="ctlModel" bType="Enum" type="ctlModel" dchg="true" fc="CF">
        <Val>status-only</Val>
      </DA>
    </DOType>
    <DOType id="PxC.Rev2007.DPL" desc="Device Name Plate" cdc="DPL">
      <DA name="vendor" bType="VisString255" fc="DC">
        <Val>Phoenix Contact GmbH &amp; Co. KG</Val>
      </DA>
      <DA name="hwRev" bType="VisString255" fc="DC" />
      <DA name="swRev" bType="VisString255" fc="DC" />
      <DA name="serNum" bType="VisString255" fc="DC" />
      <DA name="model" bType="VisString255" fc="DC" />
    </DOType>
    <DOType id="PxC.Rev2007.SPS" desc="Single Point Status" cdc="SPS">
      <DA name="stVal" bType="BOOLEAN" dchg="true" fc="ST" />
      <DA name="q" bType="Quality" qchg="true" fc="ST" />
      <DA name="t" bType="Timestamp" fc="ST" />
      <DA name="d" bType="VisString255" fc="DC" />
    </DOType>
    <DOType id="PxC.Rev2007.LPL" desc="Logical Node Name Plate" cdc="LPL">
      <DA name="vendor" bType="VisString255" fc="DC" />
      <DA name="swRev" bType="VisString255" fc="DC" />
      <DA name="d" bType="VisString255" fc="DC" />
      <DA name="configRev" bType="VisString255" fc="DC" />
      <DA name="lnNs" bType="VisString255" fc="EX" />
    </DOType>
    <DOType id="PxC.Rev2007.SPC.Direct" desc="Controllable Single Point" cdc="SPC">
      <DA name="Oper" bType="Struct" type="Oper.BOOLEAN" fc="CO" />
      <DA name="stVal" bType="BOOLEAN" dchg="true" fc="ST" />
      <DA name="q" bType="Quality" qchg="true" fc="ST" />
      <DA name="t" bType="Timestamp" fc="ST" />
      <DA name="ctlModel" bType="Enum" type="ctlModel" dchg="true" fc="CF">
        <Val>direct-with-normal-security</Val>
      </DA>
      <DA name="d" bType="VisString255" fc="DC" />
    </DOType>
    <DAType id="Originator">
      <BDA name="orCat" bType="Enum" type="orCategory" />
      <BDA name="orIdent" bType="Octet64" />
    </DAType>
    <DAType id="Oper.BOOLEAN">
      <BDA name="ctlVal" bType="BOOLEAN" />
      <BDA name="origin" bType="Struct" type="Originator" />
      <BDA name="ctlNum" bType="INT8U" />
      <BDA name="T" bType="Timestamp" />
      <BDA name="Test" bType="BOOLEAN" />
      <BDA name="Check" bType="Check" />
    </DAType>
    <EnumType id="Beh">
      <EnumVal ord="1">on</EnumVal>
      <EnumVal ord="2">on-blocked</EnumVal>
      <EnumVal ord="3">test</EnumVal>
      <EnumVal ord="4">test/blocked</EnumVal>
      <EnumVal ord="5">off</EnumVal>
    </EnumType>
    <EnumType id="Health">
      <EnumVal ord="1">Ok</EnumVal>
      <EnumVal ord="2">Warning</EnumVal>
      <EnumVal ord="3">Alarm</EnumVal>
    </EnumType>
    <EnumType id="Mod">
      <EnumVal ord="1">on</EnumVal>
      <EnumVal ord="2">on-blocked</EnumVal>
      <EnumVal ord="3">test</EnumVal>
      <EnumVal ord="4">test/blocked</EnumVal>
      <EnumVal ord="5">off</EnumVal>
    </EnumType>
    <EnumType id="ctlModel">
      <EnumVal ord="0">status-only</EnumVal>
      <EnumVal ord="1">direct-with-normal-security</EnumVal>
      <EnumVal ord="2">sbo-with-normal-security</EnumVal>
      <EnumVal ord="3">direct-with-enhanced-security</EnumVal>
      <EnumVal ord="4">sbo-with-enhanced-security</EnumVal>
    </EnumType>
    <EnumType id="orCategory">
      <EnumVal ord="0">not-supported</EnumVal>
      <EnumVal ord="1">bay-control</EnumVal>
      <EnumVal ord="2">station-control</EnumVal>
      <EnumVal ord="3">remote-control</EnumVal>
      <EnumVal ord="4">automatic-bay</EnumVal>
      <EnumVal ord="5">automatic-station</EnumVal>
      <EnumVal ord="6">automatic-remote</EnumVal>
      <EnumVal ord="7">maintenance</EnumVal>
      <EnumVal ord="8">process</EnumVal>
    </EnumType>
  </DataTypeTemplates>
</SCL>