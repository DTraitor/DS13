import { useBackend, useSharedState } from '../backend';
import { Box, AnimatedNumber, Button, LabeledList, ProgressBar, Section, Stack, Tabs, Icon, Divider, Flex } from '../components';
import { Window } from '../layouts';
import { round } from 'common/math';
import { Fragment } from 'inferno';

export const RDConsole = (props, context) => {
  const { data } = useBackend(context);
  const [tab_main, setTab_main] = useSharedState(context, 'tab_main', 1);

  const {
    lathe_data,
    lathe_all_cats,
    lathe_possible_designs,
    imprinter_data,
    imprinter_possible_designs,
    imprinter_all_cats,
  } = data;

  return (
    <Window
      width={1000}
      height={800}
      scrollable={false}>
      <Window.Content>
        <Tabs>
          <Tabs.Tab
            selected={tab_main === 1}
            onClick={() => setTab_main(1)}>
            Main
          </Tabs.Tab>
          <Tabs.Tab
            selected={tab_main === 2}
            onClick={() => setTab_main(2)}>
            Research
          </Tabs.Tab>
          <Tabs.Tab
            selected={tab_main === 3}
            onClick={() => setTab_main(3)}>
            Protolathe
          </Tabs.Tab>
          <Tabs.Tab
            selected={tab_main ===4}
            onClick={() => setTab_main(4)}>
            Circuit Imprinter
          </Tabs.Tab>
        </Tabs>
        {tab_main === 1 && (
          <MainTab />
        )}
        {tab_main === 2 && (
          <Research />
        )}
        {tab_main === 3 && (
          <MachineTab title="Protolathe Menu" machine_data={lathe_data} possible_designs={lathe_possible_designs} all_cats={lathe_all_cats} />
        )}
        {tab_main === 4 && (
          <MachineTab title="Circuit Imprinter Menu" machine_data={imprinter_data} possible_designs={imprinter_possible_designs} all_cats={imprinter_all_cats} />
        )}
      </Window.Content>
    </Window>
  );
};

const MainTab = (props, context) => {
  const { act, data } = useBackend(context);

  const {
    sync,
    has_protolathe,
    has_imprinter,
    has_destroy,
  } = data;

  return (
    <Stack vertical fill height="95%">
      <Stack.Item>
        <Stack fill>
          <Stack.Item>
            <Section fill title="Settings">
              <Stack vertical>
                <Stack.Item>
                  <Button icon="sync" disabled={!sync} tooltip="Synchronizes technologies and designs with connected server."
                    tooltipPosition="bottom-start">
                    Sync Database with Network
                  </Button>
                </Stack.Item>
                <Stack.Item>
                  <Button.Checkbox checked={sync} onClick={() => act("togglesync")} icon="lightbulb">
                    Connection to Research Network
                  </Button.Checkbox>
                </Stack.Item>
                <Stack.Item>
                  <Button icon="lock" tooltip="Locks console to prevent unauthorized use."
                    tooltipPosition="bottom-start">
                    Lock Console
                  </Button>
                </Stack.Item>
                <Stack.Item>
                  <Button onClick={() => act("resync_machines")} icon="link">
                    Re-sync with Nearby Devices
                  </Button>
                </Stack.Item>
                <Stack.Item>
                  <Button disabled={!has_protolathe} onClick={() => act("disconnect", { machine: 2 })} icon="times">
                    Disconnect Protolathe
                  </Button>
                </Stack.Item>
                <Stack.Item>
                  <Button disabled={!has_imprinter} onClick={() => act("disconnect", { machine: 1 })} icon="times">
                    Disconnect Circuit Imprinter
                  </Button>
                </Stack.Item>
                <Stack.Item>
                  <Button disabled={!has_destroy} onClick={() => act("disconnect", { machine: 3 })} icon="times">
                    Disconnect Destructive Analyzer
                  </Button>
                </Stack.Item>
              </Stack>
            </Section>
          </Stack.Item>
          <Stack.Item grow basis={0}>
            <TechLevelsInfo />
          </Stack.Item>
        </Stack>
      </Stack.Item>
      <Stack.Item grow basis={0}>
        <DestructiveAnalyzer />
      </Stack.Item>
    </Stack>
  );
};

const DestructiveAnalyzer = (props, context) => {
  const { act, data } = useBackend(context);

  const {
    has_destroy,
    destroy_data,
  } = data;

  return (
    <Section fill title="Destructive Analyzer">
      {has_destroy ? (
        <Box>
          {destroy_data.loading_item ? (
            <Box textAlign="center"><br /><br />
              <Icon name="spinner" size="17" spin /><br /><br /><br />
              <Box fontSize={3}>Item is being loaded</Box>
            </Box>
          ):(
            <Box>
              {destroy_data.has_item ? (
                <Box>
                  {destroy_data.is_processing ? (
                    <Box textAlign="center"><br /><br />
                      <Icon name="spinner" size="17" spin /><br /><br /><br />
                      <Box fontSize={3}>Item is being deconstructed</Box>
                    </Box>
                  ):(
                    <Stack fontSize={1.3}>
                      <Stack.Item>
                        <img src={"da-"+destroy_data.icon_path+".png"} style={
                          "display: inline-block;"
                          + "width: 96px;"
                          + "height: 96px;"
                          + "vertical-align: middle;"
                          + "-ms-interpolation-mode: nearest-neighbor;"
                        } />
                      </Stack.Item>
                      <Stack.Item>
                        <Stack vertical>
                          <Stack.Item bold>
                            {destroy_data.item_name}
                          </Stack.Item>
                          <Stack.Item>
                            <Box width={50}>
                              {destroy_data.item_desc}
                            </Box>
                          </Stack.Item>
                          <Stack.Item>
                            <Stack vertical>
                              {destroy_data.tech_data
                                && destroy_data.tech_data.map((tech, i) => (
                                  <Stack.Item key={tech.id}>
                                    <ProgressBar minValue={0}
                                      value={tech.level}
                                      maxValue={20}>
                                      <Stack justify="space-between">
                                        <Stack.Item>
                                          {tech.name}
                                        </Stack.Item>
                                        <Stack.Item>
                                          {tech.level}
                                        </Stack.Item>
                                      </Stack>
                                    </ProgressBar>
                                  </Stack.Item>
                                ))}
                            </Stack>
                          </Stack.Item>
                          <Stack.Item>
                            <Box inline bold>Research points: </Box> <Box inline color="orange">{destroy_data.item_tech_points} points</Box>
                          </Stack.Item>
                          <Stack.Item>
                            <Box inline bold>Research value:</Box> <Box inline color="orange">{destroy_data.item_tech_mod}%</Box>
                          </Stack.Item>
                        </Stack>
                      </Stack.Item>
                      <Stack.Item>
                        <Stack vertical>
                          <Stack.Item>
                            <Button onClick={() => act('eject_decon')}>Eject Item</Button>
                          </Stack.Item>
                          <Stack.Item>
                            <Button onClick={() => act('deconstruct')}>Deconstruct Item</Button>
                          </Stack.Item>
                        </Stack>
                      </Stack.Item>
                    </Stack>
                  )}
                </Box>
              ):(
                <Box>No item loaded</Box>
              )}
            </Box>
          )}
        </Box>
      ):(
        <Box fontSize={5} textColor="red">No Destructive Analyzer Linked</Box>
      )}
    </Section>
  );
};

const MachineMaterialsTab = (props, context) => {
  const { act } = useBackend(context);

  const {
    machine_data,
    title,
  } = props;

  return (
    <Section title={title}>
      <LabeledList>
        <LabeledList.Item labelColor="white" label="Total Materials">
          <ProgressBar
            minValue={0}
            maxValue={machine_data.max_material_storage}
            value={machine_data.total_materials}>
            <AnimatedNumber value={machine_data.total_materials} /> cm³/
            {machine_data.max_material_storage} cm³
          </ProgressBar>
        </LabeledList.Item>
        {machine_data.materials
          && machine_data.materials.map((material, i) => (
            <LabeledList.Item key={material.name} labelColor="orange" label={material.name} buttons={
              <>
                {material.amount >= 2000 ? (
                  <Button onClick={() => act("eject", { machine: machine_data.machine_id, id: material.id, amount: 1 })} mx={0.5}>
                    Eject x1
                  </Button>
                ):null}
                {material.amount >= 10000 ? (
                  <Button onClick={() => act("eject", { machine: machine_data.machine_id, id: material.id, amount: 5 })}>
                    Eject x5
                  </Button>
                ):null}
                {material.amount >= 2000 ? (
                  <Button.Input
                    maxValue={round(parseInt(material.amount,
                      10)/2000, 1)}
                    value={1}
                    content={"Eject [Max:"+round(parseInt(material.amount,
                      10)/2000, 1)+"]"}
                    onCommit={(e, value) => act('eject', {
                      id: material.id,
                      machine: machine_data.machine_id,
                      amount: value })} />
                ):null}
              </>
            }>
              <Box inline><AnimatedNumber value={material.amount} /> cm³</Box>
            </LabeledList.Item>
          ))}
      </LabeledList>
    </Section>
  );
};

const MachineReagentsTab = (props, context) => {
  const { act } = useBackend(context);

  const {
    machine_data,
    title,
  } = props;

  return (
    <Section title={title}>
      <LabeledList>
        <LabeledList.Item labelColor="white" label="Total Reagents">
          <ProgressBar
            minValue={0}
            maxValue={machine_data.maximum_volume}
            value={machine_data.total_volume}>
            <AnimatedNumber value={machine_data.total_volume} />u
            /{machine_data.maximum_volume}u
          </ProgressBar>
        </LabeledList.Item>
        {machine_data.reagents
          && machine_data.reagents.map((reagent, i) => (
            <LabeledList.Item key={reagent.name} labelColor="orange" label={reagent.name} buttons={
              <>
                <Button onClick={() => act("purge", { machine: machine_data.machine_id, type: reagent.type, volume: 1 })} mx={0.5}>
                  Purge 1u
                </Button>
                {reagent.volume >= 5 ? (
                  <Button onClick={() => act("purge", { machine: machine_data.machine_id, type: reagent.type, volume: 5 })} mx={0.5}>
                    Purge 5u
                  </Button>
                ):null}
                <Button.Input
                  maxValue={round(parseInt(reagent.volume,
                    10), 1)}
                  value={1}
                  content={"Purge [Max: "+round(parseInt(reagent.volume,
                    10), 1)+"]"}
                  onCommit={(e, value) => act('purge', {
                    type: reagent.type,
                    machine: machine_data.machine_id,
                    volume: value })} />
              </>
            }>
              <AnimatedNumber value={reagent.volume} />u
            </LabeledList.Item>
          ))}
      </LabeledList>
    </Section>
  );
};

const TechLevelsInfo = (props, context) => {
  const { data } = useBackend(context);

  const {
    tech_trees,
  } = data;

  return (
    <Section fill title="Technology Research">
      <LabeledList>
        {tech_trees && tech_trees.map((tech_tree, i) => (
          <LabeledList.Item key={tech_tree.name} labelColor="white" label={tech_tree.shortname}>
            <ProgressBar
              minValue={0}
              maxValue={tech_tree.maxlevel}
              value={tech_tree.level}>
              {tech_tree.level}/{tech_tree.maxlevel}
            </ProgressBar>
          </LabeledList.Item>
        ))}
      </LabeledList>
    </Section>
  );
};

const Research = (props, context) => {
  const { act, data } = useBackend(context);
  const [selected_tech_tree, set_selected_tech_tree] = useSharedState(context, 'selected_tech_tree', 'engineering');
  const [selected_tech, set_selected_tech] = useSharedState(context, 'selected_tech');

  const {
    tech_trees,
    techs,
    lines,
    research_points,
  } = data;

  return (
    <Stack vertical>
      <Stack.Item>
        <Section fill height={45} title="Research Menu" buttons={<Box>Research Points: <span style={{ color: "orange" }}>{research_points}</span></Box>}>
          <Tabs>
            {tech_trees && tech_trees.map((tech_tree, i) => (
              <Box key={tech_tree.id}>
                <Tabs.Tab
                  selected={tech_tree.id === selected_tech_tree}
                  onClick={() => set_selected_tech_tree(tech_tree.id)}>
                  {tech_tree.shortname}
                </Tabs.Tab>
              </Box>
            ))}
          </Tabs>
          {lines && lines.map((line, i) => (
            <Box key={i}>
              {line.category === selected_tech_tree ? (
                <Box position="absolute"
                  width={line.width+"%"}
                  height={line.height+"%"}
                  left={line.line_x+"%"}
                  bottom={line.line_y+10+"%"}
                  className={(line.istop?"sciBorderTop":"sciBorderBottom")+" "+(line.isright?"sciBorderRight":"sciBorderLeft")} />
              ):null}
            </Box>
          ))}
          {techs && techs.map((tech, i) => (
            <Box key={tech.id}>
              {tech.tech_type === selected_tech_tree ? (
                <Button
                  position="absolute"
                  className={(selected_tech && tech.id===selected_tech.id?"Button--color--caution":(tech.isresearched?"Button--selected":(tech.canresearch?"Button--color--default":"sciCantResearch")))+" sciNoPadding"}
                  left={tech.x-1.5+"%"}
                  bottom={tech.y+7+"%"}
                  width="32px"
                  height="32px"
                  tooltip={
                    <Box>
                      {tech.name}
                      <br />
                      {tech.desc}
                    </Box>
                  }
                  tooltipPosition="bottom-start"
                  onClick={() => set_selected_tech(tech)}>
                  <Box className={"rdtech32x32 "+tech.id} />
                </Button>
              ):null}
            </Box>
          ))}
        </Section>
      </Stack.Item>
      <Stack.Item>
        {selected_tech?(
          <Section height={14.5} title={selected_tech.name}>
            <Stack>
              <Stack.Item>
                <Stack>
                  <Stack.Item>
                    <div class={"rdtech_big96x96 "+selected_tech.id} />
                  </Stack.Item>
                  <Stack.Item>
                    {selected_tech.desc}
                    <Box> Cost: <span style={{ color: "orange" }}>{selected_tech.cost}</span></Box>
                  </Stack.Item>
                </Stack>
              </Stack.Item>
              <Stack.Item>
                Unlocks Designs:
                {selected_tech.unlocks_design
                && selected_tech.unlocks_design.map((design, i) => (
                  <Box key={design}>
                    <span style={{ color: "#27f2eb" }}>{design}</span>
                  </Box>
                ))}
              </Stack.Item>
              <Stack.Item>
                Required Technology:
                {selected_tech.req_techs_unlock
                && selected_tech.req_techs_unlock.map((req_tech, i) => (
                  <Box key={req_tech}>
                    <span style={{ color: "lime" }}>{req_tech}</span>
                  </Box>
                ))}
                {selected_tech.req_techs_lock
                && selected_tech.req_techs_lock.map((req_tech, i) => (
                  <Box key={req_tech}>
                    <span style={{ color: "red" }}>{req_tech}</span>
                  </Box>
                ))}
              </Stack.Item>
              <Stack.Item>
                <Button onClick={() => act('research_tech', { tech_id: selected_tech.id })}>
                  Research
                </Button>
              </Stack.Item>
            </Stack>
          </Section>
        ):(
          <Section fill height={14.5} title="No Technology Selected" />
        )}
      </Stack.Item>
    </Stack>
  );
};

const MachineTab = (props, context) => {
  const { act } = useBackend(context);
  const {
    title,
    machine_data,
    possible_designs,
    all_cats,
  } = props;
  const [currentTab, setCurrentTab] = useSharedState(context, props.machine_data.machine_id, "Misc");

  return (
    <Stack justify="space-between" height="95%">
      <Stack.Item grow basis={0}>
        <Section fill title={title}>
          <Tabs>
            <Stack wrap="wrap">
              {all_cats && all_cats.map((category, i) => (
                <Stack.Item key={category}>
                  <Tabs.Tab
                    my={0.5}
                    selected={currentTab === category}
                    onClick={() => setCurrentTab(category)}>
                    {category}
                  </Tabs.Tab>
                </Stack.Item>
              ))}
            </Stack>
          </Tabs>
          <Flex direction="column">
            {possible_designs
              && possible_designs.map((design, i) => (
                <Fragment key={design.id}>
                  {design.category === currentTab ? (
                    <Flex.Item>
                      <Stack justify="space-between">
                        <Stack.Item width="40%">
                          {design.name}
                          <br />
                          <Box color="label">
                            {design.desc}
                          </Box>
                        </Stack.Item>
                        <Stack.Item grow>
                          <Flex>
                            <Flex.Item>
                              <Button
                                icon="wrench"
                                onClick={() => act(buildName,
                                  { build: design.id,
                                    imprint: design.id })}>
                                Build
                              </Button>
                            </Flex.Item>
                            <Flex.Item>
                              {design.can_create >= 5 && (
                                <Button
                                  mx={0.3}
                                  onClick={() => act(buildFiveName,
                                    { build: design.id, imprint: design.id })}>
                                  x5
                                </Button>
                              )}
                            </Flex.Item>
                            <Flex.Item>
                              {design.can_create >= 10 && (
                                <Button
                                  onClick={() => act(buildFiveName,
                                    { build: design.id, imprint: design.id })}>
                                  x10
                                </Button>
                              )}
                            </Flex.Item>
                          </Flex>
                        </Stack.Item>
                        <Stack.Item>
                          {design.mats && design.mats.map((mat, i) => (
                            <Box inline key={mat.id}>
                              {mat.amount} {mat.name}
                            </Box>
                          ))}
                        </Stack.Item>
                      </Stack>
                      <Divider />
                    </Flex.Item>
                  ):null}
                </Fragment>
              ))}
          </Flex>
        </Section>
      </Stack.Item>
      <Stack.Item width="45%">
        <Stack vertical fill>
          <Stack.Item>
            <MachineMaterialsTab machine_data={machine_data} title="Protolathe Material Storage" />
          </Stack.Item>
          <Stack.Item>
            <MachineReagentsTab machine_data={machine_data} title="Protolathe Reagent Storage" />
          </Stack.Item>
          <Stack.Item grow>
            <Section title="Queue" fill />
          </Stack.Item>
        </Stack>
      </Stack.Item>
    </Stack>
  );
};
