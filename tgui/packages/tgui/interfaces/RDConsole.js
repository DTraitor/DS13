import { useBackend, useSharedState, useLocalState } from '../backend';
import { Box, AnimatedNumber, Button, LabeledList, ProgressBar, Section, Stack, Tabs, NumberInput, Icon, ByondUi } from '../components';
import { Window } from '../layouts';

export const RDConsole = (props, context) => {
  const { act, data } = useBackend(context);
  const [tab_main, setTab_main] = useSharedState(context, 'tab_main', 1);

  const {
    sync,
    can_research,
    research_points,
    has_protolathe,
    lathe_data,
    lathe_queue_data,
    lathe_possible_designs,
    lathe_all_cats,
    has_imprinter,
    imprinter_data,
    imprinter_queue_data,
    imprinter_possible_designs,
    imprinter_all_cats,
    has_destroy,
    destroy_data,
    tech_trees,
    techs,
    lines,
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
          <ProtolatheMenu />
        )}
        {tab_main === 4 && (
          <CircuitMenu />
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
    <Stack fill vertical>
      <Stack.Item>
        <Stack fill justify="space-between">
          <Stack.Item>
            <Section fill title="Settings">
              <Stack vertical>
                <Stack.Item>
                  <Button icon="sync">
                    Sync Database with Network
                  </Button>
                </Stack.Item>
                <Stack.Item>
                  <Button.Checkbox checked={sync} onClick={() => act("togglesync")} icon="lightbulb">
                    Connection to Research Network
                  </Button.Checkbox>
                </Stack.Item>
                <Stack.Item>
                  <Button icon="lock">
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
          <Stack.Item grow>
            <Section title="Technology Research">
              <TechLevelsInfo />
            </Section>
            <Section title="Protolathe Material Storage">
              <ProtolatheInfoTab />
            </Section>
            <Section title="Circuit Imprinter Material Storage">
              <ImprinterInfoTab />
            </Section>
          </Stack.Item>
        </Stack>
      </Stack.Item>
      <Stack.Item grow>
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
        <Box style={{ src: destroy_data.icon }} />
      ):(
        <Box fontSize={5} textColor="red">No Destructive Analyzer Linked</Box>
      )}
    </Section>
  );
};

const ProtolatheInfoTab = (props, context) => {
  const { act, data } = useBackend(context);
  const [eject_ammount_lathe, set_eject_ammount_lathe] = useLocalState(context, 'eject_ammount_lathe', 1);

  const {
    has_protolathe,
    lathe_data,
  } = data;

  return (
    <LabeledList>
      {has_protolathe ? (
        <>
          <LabeledList.Item label="Total Materials">
            <ProgressBar my={0.5} minValue={0}
              maxValue={lathe_data.max_material_storage}
              value={lathe_data.total_materials}>
              <AnimatedNumber value={lathe_data.total_materials} />
              /{lathe_data.max_material_storage}
            </ProgressBar>
          </LabeledList.Item>
          {lathe_data.materials && lathe_data.materials.map((material, i) => (
            <LabeledList.Item key={material.name} labelColor="orange" label={material.name}>
              <AnimatedNumber value={material.ammount} />
              {material.ammount >= 2000 ? (
                <Button onClick={() => act("eject", { eject_type: 2, sheet_type: material.id, amount: 1 })} mx={0.5}>
                  Eject x1
                </Button>
              ):null}
              {material.ammount >= 10000 ? (
                <Button onClick={() => act("eject", { eject_type: 2, sheet_type: material.id, amount: 5 })}>
                  Eject x5
                </Button>
              ):null}
              {material.ammount >= 2000 ? (
                <>
                  <NumberInput
                    minValue={1}
                    maxValue={50}
                    value={eject_ammount_lathe}
                    width={1}
                    onChange={(e, value) => set_eject_ammount_lathe(value)} />
                  <Button onClick={() => act("eject", { eject_type: 2, sheet_type: material.id, amount: eject_ammount_lathe })}>
                    Eject
                  </Button>
                </>
              ):null}
            </LabeledList.Item>
          ))}
        </>
      ):(
        <Box color="red" fontSize={4} textAlign="center">
          No Protolathe Linked
        </Box>
      )}
    </LabeledList>
  );
};

const ImprinterInfoTab = (props, context) => {
  const { act, data } = useBackend(context);
  const [eject_ammount_circuit, set_eject_ammount_circuit] = useLocalState(context, 'eject_ammount_circuit', 1);

  const {
    has_imprinter,
    imprinter_data,
  } = data;

  return (
    <LabeledList>
      {has_imprinter ? (
        <>
          <LabeledList.Item label="Total Materials">
            <ProgressBar minValue={0}
              maxValue={imprinter_data.max_material_storage}
              value={imprinter_data.total_materials}>
              <AnimatedNumber value={imprinter_data.total_materials} />/
              {imprinter_data.max_material_storage}
            </ProgressBar>
          </LabeledList.Item>
          {imprinter_data.materials
          && imprinter_data.materials.map((material, i) => (
            <LabeledList.Item key={material.name} labelColor="orange" label={material.name}>
              <AnimatedNumber value={material.ammount} />
              {material.ammount >= 2000 ? (
                <Button onClick={() => act("eject", { eject_type: 1, sheet_type: material.id, amount: 1 })} mx={0.5}>
                  Eject x1
                </Button>
              ):null}
              {material.ammount >= 10000 ? (
                <Button onClick={() => act("eject", { eject_type: 1, sheet_type: material.id, amount: 5 })}>
                  Eject x5
                </Button>
              ):null}
              {material.ammount >= 2000 ? (
                <>
                  <NumberInput
                    minValue={1}
                    maxValue={100}
                    value={eject_ammount_circuit}
                    width={1}
                    onChange={(e, value) => set_eject_ammount_circuit(value)} />
                  <Button onClick={() => act("eject", { eject_type: 1, sheet_type: material.id, amount: eject_ammount_circuit })}>
                    Eject
                  </Button>
                </>
              ):null}
            </LabeledList.Item>
          ))}
        </>
      ):(
        <Box color="red" fontSize={4} textAlign="center">
          No Circuit Imprinter Linked
        </Box>
      )}
    </LabeledList>
  );
};

const TechLevelsInfo = (props, context) => {
  const { data } = useBackend(context);

  const {
    tech_trees,
  } = data;

  return (
    <LabeledList>
      {tech_trees && tech_trees.map((tech_tree, i) => (
        <Stack key={tech_tree.name} vertical>
          {tech_tree.show ? (
            <Stack.Item>
              <LabeledList.Item label={tech_tree.shortname}>
                <ProgressBar
                  minValue={0}
                  maxValue={tech_tree.maxlevel}
                  value={tech_tree.level}>
                  {tech_tree.level}/{tech_tree.maxlevel}
                </ProgressBar>
              </LabeledList.Item>
            </Stack.Item>
          ) : null}
        </Stack>
      ))}
    </LabeledList>
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
                {tech_tree.show ? (
                  <Tabs.Tab
                    selected={tech_tree.id === selected_tech_tree}
                    onClick={() => set_selected_tech_tree(tech_tree.id)}>
                    {tech_tree.shortname}
                  </Tabs.Tab>
                ):null}
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
                  bottom={line.line_y+"%"}
                  class={(line.istop?"sciBorderTop":"sciBorderBottom")+" "+(line.isright?"sciBorderRight":"sciBorderLeft")} />
              ):null}
            </Box>
          ))}
          {techs && techs.map((tech, i) => (
            <Box key={tech.id}>
              {tech.tech_type === selected_tech_tree ? (
                <Button
                  position="absolute"
                  left={tech.x - 1.5 + "%"}
                  bottom={tech.y - 3 + "%"}
                  class={"sciTechTreeBox"+" "+(selected_tech===tech?"sciTechSelected":(tech.isresearched?"sciTechResearched":(tech.canresearch?"sciTechCanResearch":"sciTechCantResearch")))}
                  onClick={() => set_selected_tech(tech)}>
                  <Box class={"sciTechTreeIcon icon-"+tech.icon} />
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
                    <img src="sdivet.png" style={
                      "display: inline-block;"
                      + "width: 96px;"
                      + "height: 96px;"
                      + "vertical-align: middle;"
                      + "-ms-interpolation-mode: nearest-neighbor;"
                    } />
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
                    {}
                    <span style={{ color: "lime" }}>{req_tech}</span>
                  </Box>
                ))}
                {selected_tech.req_techs_lock
                && selected_tech.req_techs_lock.map((req_tech, i) => (
                  <Box key={req_tech}>
                    {}
                    <span style={{ color: "red" }}>{req_tech}</span>
                  </Box>
                ))}
              </Stack.Item>
              <Stack.Item>
                <Button onClick={() => act("research_tech", { tech_id: selected_tech.id })}>
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

const ProtolatheMenu = (props, context) => {
  const { data } = useBackend(context);
  const [tab_protolathe, setTab_protolathe] = useSharedState(context, 'tab_protolathe', "Unspecified");

  const {
    lathe_all_cats,
    lathe_possible_designs,
  } = data;

  return (
    <Stack justify="space-between" fill>
      <Stack.Item>
        <Section fill width={50.5} title="Protolathe Menu">
          <Tabs>
            <Stack wrap="wrap">
              {lathe_all_cats && lathe_all_cats.map((lathe_category, i) => (
                <Stack.Item key={lathe_category}>
                  <Tabs.Tab
                    my={0.5}
                    selected={tab_protolathe === lathe_category}
                    onClick={() => setTab_protolathe(lathe_category)}>
                    {lathe_category}
                  </Tabs.Tab>
                </Stack.Item>
              ))}
            </Stack>
          </Tabs>
          <LabeledList>
            {lathe_possible_designs
            && lathe_possible_designs.map((design, i) => (
              <Box key={design.id}>
                {design.category === tab_protolathe ? (
                  <LabeledList.Item label={design.name}>
                    Test
                  </LabeledList.Item>
                ):null}
              </Box>
            ))}
          </LabeledList>
        </Section>
      </Stack.Item>
      <Stack.Item>
        <Stack vertical>
          <Stack.Item>
            <Section width={31} title="Protolathe Material Storage">
              <ProtolatheInfoTab />
            </Section>
          </Stack.Item>
          <Stack.Item>
            <Section title="Queue" />
          </Stack.Item>
        </Stack>
      </Stack.Item>
    </Stack>
  );
};

const CircuitMenu = (props, context) => {
  const { data } = useBackend(context);
  const [tab_circuit, setTab_circuit] = useSharedState(context, 'tab_circuit', "Unspecified");

  const {
    imprinter_all_cats,
  } = data;

  return (
    <Stack justify="space-between" fill>
      <Stack.Item>
        <Section fill title="Circuit Imprinter Menu">
          <Tabs>
            {imprinter_all_cats
              && imprinter_all_cats.map((imprinter_category, i) => (
                <Tabs.Tab
                  key={imprinter_category}
                  selected={tab_circuit === imprinter_category}
                  onClick={() => setTab_circuit(imprinter_category)}>
                  {imprinter_category}
                </Tabs.Tab>
              ))}
          </Tabs>
        </Section>
      </Stack.Item>
      <Stack.Item>
        <Stack vertical>
          <Stack.Item>
            <Section width={35} title="Circuit Imprinter Material Storage">
              <ImprinterInfoTab />
            </Section>
          </Stack.Item>
          <Stack.Item>
            <Section title="Queue" />
          </Stack.Item>
        </Stack>
      </Stack.Item>
    </Stack>
  );
};
