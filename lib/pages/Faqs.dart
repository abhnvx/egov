import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Faqs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: defaultTargetPlatform == TargetPlatform.android ? 5.0 : 0.0,
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Color(0xff3090C7),
        title: Text('Faqs ',
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'Source Sans Pro',
              fontSize: 20.0,
              letterSpacing: 2.5,
              fontWeight: FontWeight.bold,
            )),
      ),
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index) =>
            EntryItem(data[index]),
        itemCount: data.length,
      ),
    );
  }
}


class Entry {
  Entry(this.title, [this.children = const <Entry>[]]);

  final String title;
  final List<Entry> children;
}


final List<Entry> data = <Entry>[
  Entry(
    'What is a coronavirus?',
    <Entry>[
      Entry(
          'Coronaviruses are a large family of viruses found in  both animals and humans. Some infect people and are known to cause illness ranging from the common cold to more severe diseases such as Middle East Respiratory Syndrome (MERS) and Severe Acute Respiratory Syndrome (SARS).'),
    ],
  ),
  Entry(
    'What is a “novel” coronavirus?',
    <Entry>[
      Entry(
          'A novel coronavirus (CoV) is a new strain of coronavirus that has not been previously identified in humans. The new, or “novel” coronavirus, now called 2019-nCoV, had not previously detected before the outbreak was reported in Wuhan, China in December 2019.'),
    ],
  ),
  Entry(
    'Is the new virus the same as SARS?',
    <Entry>[
      Entry(
          'No, 2019-nCoV is from the same family of viruses as Severe Acute Respiratory Syndrome (SARS-CoV) but it is not the same virus.'),
    ],
  ),
  Entry(
    'How dangerous is it?',
    <Entry>[
      Entry(
          'As with other respiratory illnesses, infection with 2019-nCoV can cause mild symptoms including a runny nose, sore throat, cough, and fever.  It can be more severe for some persons and can lead to pneumonia or breathing difficulties.  More rarely, the disease can be fatal. Older people, and people with pre-existing medical conditions (such as, diabetes and heart disease) appear to be more vulnerable to becoming severely ill with the virus.'),
    ],
  ),
  Entry(
    'Can humans become infected with the 2019-nCoV from an animal source?',
    <Entry>[
      Entry(
          'Detailed investigations found that SARS-CoV was transmitted from civet cats to humans in China in 2002 and MERS-CoV from dromedary camels to humans in Saudi Arabia in 2012. Several known coronaviruses are circulating in animals that have not yet infected humans.  As surveillance improves around the world, more coronaviruses are likely to be identified  The animal source of the 2019-nCoV has not yet been identified.  This does not mean you can catch 2019-nCoV from any animal or from your pet. It’s likely that an animal source from a live animal market in China was responsible for some of the first reported human infections. To protect yourself, when visiting live animal markets, avoid direct unprotected contact with live animals and surfaces in contact with animals.  The consumption of raw or undercooked animal products should be avoided. Raw meat, milk or animal organs should be handled with care, to avoid cross-contamination with uncooked foods, as per good food safety practices.'),
    ],
  ),
  Entry(
    'Can I catch 2019-nCoV from my pet?',
    <Entry>[
      Entry(
          'No, at present there is no evidence that companion animals or pets such as cats and dogs have been infected or have spread 2019-nCoV.'),
    ],
  ),
  Entry(
    'Can the 2019-nCoV be transmitted from person to person?',
    <Entry>[
      Entry(
          'Yes, the 2019-nCoV causes respiratory disease and can be transmitted from person to person, usually after close contact with an infected patient, for example, in a household workplace, or health care centre. '),
    ],
  ),
  Entry(
    'What can I do to protect myself?',
    <Entry>[
      Entry(
          'Stay aware of the latest information on the outbreak, available on WHO website, and take care of your health by doing the following:  Wash your hands frequently with an alcohol-based hand rub or soap and water Why? Washing your hands with an alcohol-based hand rub or soap and water kills the virus if it is on your hands.  Maintain social distancing – maintain at least 1 metre (3 feet) distance between yourself and other people, particularly those who are coughing, sneezing and have a fever. Why? When someone who is infected with a respiratory disease, like 2019-nCoV, coughs or sneezes they project small droplets containing the virus. If you are too close, you can breathe in the virus  Avoid touching eyes, nose and mouth Why? Hands touch many surfaces which can be contaminated with the virus. If you touch your eyes, nose or mouth with your contaminated hands, you can transfer the virus from the surface to yourself.  If you have fever, cough and difficulty breathing, seek medical care early. Tell your health care provider if you have travelled in an area in China where 2019-nCoV has been reported, or if you have been in close contact with someone with who has travelled from China and has respiratory symptoms. Why? Whenever you have fever, cough and difficulty breathing it’s important to seek medical attention promptly as this may be due to a respiratory infection or other serious condition. Respiratory symptoms with fever can have a range of causes, and depending on your personal travel history and circumstances, 2019-nCoV could be one of them.  If you have mild respiratory symptoms and no travel history to or within China, carefully practice basic respiratory and hand hygiene and stay home until you are recovered, if possible.'),
    ],
  ),
  Entry(
    'Should I wear a mask to protect myself?',
    <Entry>[
      Entry(
          'Wearing a medical mask can help limit the spread of some respiratory disease. However, using a mask alone is not guaranteed to stop infections and should be combined with other prevention measures including hand and respiratory hygiene and avoiding close contact – at least 1 metre (3 feet) distance between yourself and other people.  WHO advises on rational use of medical masks thus avoiding unnecessary wastage of precious resources and potential mis-use of masks (see Advice on the use of masks). This means using masks only if you have respiratory symptoms (coughing or sneezing), have suspected 2019-nCoV infection with mild symptoms or are caring for someone with suspected 2019-nCoV infection. A suspected 2019-nCoV infection is linked to travel in an area in China where 2019-nCoV has been reported, or close contact with someone who has travelled from China and has respiratory symptoms.disease.Ddisease suspected 2019-nCoV infection. A suspected 2019-nCoV infection is linked to travel in an area in China where 2019-nCoV has been reported, or close contact with someone who has travelled from China and has respiratory symptoms.'),
    ],
  ),
  Entry(
    'Are there any specific medicines to prevent or treat 2019-nCoV?',
    <Entry>[
      Entry(
          'To date, there is no specific medicine recommended to prevent or treat the novel coronavirus. However, those infected with 2019-nCoV should receive appropriate care to relieve and treat symptoms, and those with severe illness should receive optimized supportive care. Some specific treatments are under investigation and will be tested through clinical trials.  WHO is helping to coordinate efforts to develop medicines to treat nCoV with a range of partners.  If you want to protect yourself from getting infected with the new coronavirus, you should maintain basic hand and respiratory hygiene, and safe food practices and avoiding close contact, when possible, with anyone showing symptoms of respiratory illness such as coughing and sneezing.  The following measures are not specifically recommended as 2019-nCoV remedies as they are not effective to protect yourself and can be even harmful:  Taking vitamin C Smoking Drinking tradition herbal teas Wearing multiple masks to maximize protection Taking self-medication such as antibiotics In any case, if you have fever, cough and difficulty breathing seek medical care early to reduce the risk of developing a more severe infection and be sure to share your recent travel history with your health care provider.'),
    ],
  ),
  Entry(
    'Are antibiotics effective in preventing and treating the 2019-nCoV?',
    <Entry>[
      Entry(
          'No, antibiotics do not work against viruses, they only work on bacterial infections. The novel coronavirus is a virus and, therefore, antibiotics should not be used as a means of prevention or treatment.'),
    ],
  ),
  Entry(
    'Is it safe to receive a package from China or any other place where the virus has been identified?',
    <Entry>[
      Entry(
          'Yes, it is safe.  People receiving packages are not at risk of contracting the new coronavirus. From experience with other coronaviruses, we know that these types of viruses don’t survive long on objects, such as letters or packages.'),
    ],
  ),
  Entry(
    'Has WHO changed its advice on health protection?',
    <Entry>[
      Entry(
          'No, our advice is the same. WHO has issued advice to people on how to protect themselves from 2019-nCoV infection, as for any virus that spreads via the respiratory route.  In addition, it is vitally important in health care settings that health care workers are able to protect themselves from infection. WHO guidance on infection prevention and control measures in health care facilities can be found here.'),
    ],
  ),
  Entry(
    'Can 2019-nCoV be caught from a person who presents no symptoms?',
    <Entry>[
      Entry(
          'Understanding the time when infected patients may spread the virus to others is critical for control efforts. Detailed medical information from people infected is needed to determine the infectious period of 2019-nCoV. According to recent reports, it may possible that people infected with 2019-nCoV may be infectious before showing significant symptoms. However, based on currently available data, the people who have symptoms are causing the majority of virus spread.'),
    ],
  ),
  Entry(
    'How long is the incubation period?',
    <Entry>[
      Entry(
          'The incubation period is the time between infection and the onset of clinical symptoms of disease. Current estimates of the incubation period range from 2-11 days, and these estimates will be refined as more data become available. Based on information from other coronavirus diseases, such as MERS and SARS, the incubation period of 2019-nCoV could be up to 14 days.'),
    ],
  ),
  Entry(
    'What\'s the difference between illness caused by 2019-nCoV infection, the flu or a cold?',
    <Entry>[
      Entry(
          'People with 2019-nCoV infection, the flu, or a cold typically develop respiratory symptoms such as fever, cough and runny nose. Even though many symptoms are alike, they are caused by different viruses. Because of their similarities, it can be difficult to identify the disease based on symptoms alone. That’s why laboratory tests are required to confirm if someone has 2019-nCoV.  As always, WHO recommends that people who have cough, fever and difficulty breathing should seek medical care early. Patients should inform health care providers if they have travelled in the 14 days before they developed symptoms, or if they have been in close contact with someone with who has been sick with respiratory symptoms.'),
    ],
  ),
  Entry(
    'How long does the virus survive on surfaces?',
    <Entry>[
      Entry(
          'It is still not known how long the 2019-nCoV virus survives on surfaces, although preliminary information suggests the virus may survive a few hours. Simple disinfectants can kill the virus making it no longer possible to infect people.How does this virus spread?The new coronavirus is a respiratory virus which spreads primarily through contact with an infected person through respiratory droplets generated when a person, for example, coughs or sneezes, or through droplets of saliva or discharge from the nose. It is important that everyone practice good respiratory hygiene. For example, sneeze or cough into a flexed elbow, or use a tissue and discard it immediately into a closed bin.  It is also very important for people to wash their hands regularly with either alcohol-based hand rub or soap and water.'),
    ],
  ),
  Entry(
    'Who is at risk from developing severe illness?',
    <Entry>[
      Entry(
          'While we still need to learn more about how 2019-nCoV affects people, thus far, older people, and people with pre-existing medical conditions (such as diabetes and heart disease) appear to be more at risk of developing severe disease.'),
    ],
  ),
  Entry(
    'How does this virus spread?',
    <Entry>[
      Entry(
          'The new coronavirus is a respiratory virus which spreads primarily through contact with an infected person through respiratory droplets generated when a person, for example, coughs or sneezes, or through droplets of saliva or discharge from the nose. It is important that everyone practice good respiratory hygiene. For example, sneeze or cough into a flexed elbow, or use a tissue and discard it immediately into a closed bin.  It is also very important for people to wash their hands regularly with either alcohol-based hand rub or soap and water.'),
    ],
  ),
  Entry(
    'Who is at risk from developing severe illness?',
    <Entry>[
      Entry(
          'While we still need to learn more about how 2019-nCoV affects people, thus far, older people, and people with pre-existing medical conditions (such as diabetes and heart disease) appear to be more at risk of developing severe disease.'),
    ],
  ),
  Entry(
    'How to put on, use, take off and dispose of a mask?',
    <Entry>[
      Entry(
          'Before putting on a mask, wash hands with alcohol-based hand rub or soap and water Cover mouth and nose with mask and make sure there are no gaps between your face and the mask Avoid touching the mask while using it; if you do, clean your hands with alcohol-based hand rub or soap and water Replace the mask with a new one as soon as it is damp and do not re-use single-use masks  To remove the mask: remove it from behind (do not touch the front of mask); discard immediately in a closed bin; wash hands with alcohol-based hand rub or soap and water'),
    ],
  ),
  Entry(
    'Who can catch this virus?',
    <Entry>[
      Entry(
          'People living or travelling in an area where the 2019-nCoV virus is circulating may be at risk of infection. At present, 2019-nCoV is circulating in China where the vast majority of people infected have been reported. Those infected from other countries are among people who have recently traveled from China or who have been living or working closely with those travellers, such as family members, co-workers or medical professionals caring for a patient before they knew the patient was infected with 2019-nCoV.  Health workers caring for persons who are sick with 2019-nCoV are at higher risk and must protect themselves with appropriate infection prevention and control procedures.  People living outside of areas in China where the virus is circulating are not at risk of infection with 2019-nCoV.   WHO is continuously monitoring the epidemiology of this outbreak to better understand where the virus is circulating and how people can protect themselves from infection.  For more information, see WHO’s latest situation reports: https://www.who.int/emergencies/diseases/novel-coronavirus-2019/situation-reports/'),
    ],
  ),
];

// Displays one Entry. If the entry has children then it's displayed
// with an ExpansionTile.
class EntryItem extends StatelessWidget {
  const EntryItem(this.entry);

  final Entry entry;

  Widget _buildTiles(Entry root) {
    if (root.children.isEmpty) return ListTile(title: Text(root.title));
    return ExpansionTile(
      key: PageStorageKey<Entry>(root),
      title: Text(root.title),
      children: root.children.map(_buildTiles).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildTiles(entry);
  }
}
