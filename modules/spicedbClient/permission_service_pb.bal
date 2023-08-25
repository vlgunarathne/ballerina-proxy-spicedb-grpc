import ballerina/grpc;
import ballerina/protobuf;

public const string PERMISSION_SERVICE_DESC = "0A187065726D697373696F6E5F736572766963652E70726F746F120E617574687A65642E6170692E76311A1C676F6F676C652F70726F746F6275662F7374727563742E70726F746F1A1C676F6F676C652F6170692F616E6E6F746174696F6E732E70726F746F1A1776616C69646174652F76616C69646174652E70726F746F1A0A636F72652E70726F746F229C020A0B436F6E73697374656E637912340A106D696E696D697A655F6C6174656E63791801200128084207FA42046A0208014800520F6D696E696D697A654C6174656E637912450A1161745F6C656173745F61735F667265736818022001280B32182E617574687A65642E6170692E76312E5A6564546F6B656E4800520E61744C656173744173467265736812460A1161745F65786163745F736E617073686F7418032001280B32182E617574687A65642E6170692E76312E5A6564546F6B656E4800520F61744578616374536E617073686F7412340A1066756C6C795F636F6E73697374656E741804200128084207FA42046A0208014800520F66756C6C79436F6E73697374656E7442120A0B726571756972656D656E741203F84201228C030A1252656C6174696F6E7368697046696C746572126D0A0D7265736F757263655F747970651801200128094248FA42457243288001323E5E285B612D7A5D5B612D7A302D395F5D7B312C36317D5B612D7A302D395D2F292A5B612D7A5D5B612D7A302D395F5D7B312C36327D5B612D7A302D395D24520C7265736F757263655479706512570A146F7074696F6E616C5F7265736F757263655F69641802200128094225FA42227220288008321B5E285B612D7A412D5A302D392F5F7C5C2D3D2B5D7B312C7D293F2452126F7074696F6E616C5265736F75726365496412570A116F7074696F6E616C5F72656C6174696F6E180320012809422AFA42277225284032215E285B612D7A5D5B612D7A302D395F5D7B312C36327D5B612D7A302D395D293F2452106F7074696F6E616C52656C6174696F6E12550A176F7074696F6E616C5F7375626A6563745F66696C74657218042001280B321D2E617574687A65642E6170692E76312E5375626A65637446696C74657252156F7074696F6E616C5375626A65637446696C746572228D030A0D5375626A65637446696C746572126B0A0C7375626A6563745F747970651801200128094248FA42457243288001323E5E285B612D7A5D5B612D7A302D395F5D7B312C36317D5B612D7A302D395D2F292A5B612D7A5D5B612D7A302D395F5D7B312C36327D5B612D7A302D395D24520B7375626A65637454797065125A0A136F7074696F6E616C5F7375626A6563745F6964180220012809422AFA4227722528800832205E28285B612D7A412D5A302D392F5F7C5C2D3D2B5D7B312C7D297C5C2A293F2452116F7074696F6E616C5375626A656374496412590A116F7074696F6E616C5F72656C6174696F6E18032001280B322C2E617574687A65642E6170692E76312E5375626A65637446696C7465722E52656C6174696F6E46696C74657252106F7074696F6E616C52656C6174696F6E1A580A0E52656C6174696F6E46696C74657212460A0872656C6174696F6E180120012809422AFA42277225284032215E285B612D7A5D5B612D7A302D395F5D7B312C36327D5B612D7A302D395D293F24520872656C6174696F6E22AC020A185265616452656C6174696F6E736869707352657175657374123D0A0B636F6E73697374656E637918012001280B321B2E617574687A65642E6170692E76312E436F6E73697374656E6379520B636F6E73697374656E6379125D0A1372656C6174696F6E736869705F66696C74657218022001280B32222E617574687A65642E6170692E76312E52656C6174696F6E7368697046696C7465724208FA42058A01021001521272656C6174696F6E7368697046696C74657212310A0E6F7074696F6E616C5F6C696D697418032001280D420AFA42072A0518E8072800520D6F7074696F6E616C4C696D6974123F0A0F6F7074696F6E616C5F637572736F7218042001280B32162E617574687A65642E6170692E76312E437572736F72520E6F7074696F6E616C437572736F7222EC010A195265616452656C6174696F6E7368697073526573706F6E7365123B0A07726561645F617418012001280B32182E617574687A65642E6170692E76312E5A6564546F6B656E4208FA42058A010210015206726561644174124A0A0C72656C6174696F6E7368697018022001280B321C2E617574687A65642E6170692E76312E52656C6174696F6E736869704208FA42058A01021001520C72656C6174696F6E7368697012460A1361667465725F726573756C745F637572736F7218032001280B32162E617574687A65642E6170692E76312E437572736F7252116166746572526573756C74437572736F722286020A0C507265636F6E646974696F6E12500A096F7065726174696F6E18012001280E32262E617574687A65642E6170692E76312E507265636F6E646974696F6E2E4F7065726174696F6E420AFA42078201041001200052096F7065726174696F6E12440A0666696C74657218022001280B32222E617574687A65642E6170692E76312E52656C6174696F6E7368697046696C7465724208FA42058A01021001520666696C746572225E0A094F7065726174696F6E12190A154F5045524154494F4E5F554E5350454349464945441000121C0A184F5045524154494F4E5F4D5553545F4E4F545F4D41544348100112180A144F5045524154494F4E5F4D5553545F4D41544348100222CC010A19577269746552656C6174696F6E736869707352657175657374124B0A077570646174657318012003280B32222E617574687A65642E6170692E76312E52656C6174696F6E73686970557064617465420DFA420A92010722058A0102100152077570646174657312620A166F7074696F6E616C5F707265636F6E646974696F6E7318022003280B321C2E617574687A65642E6170692E76312E507265636F6E646974696F6E420DFA420A92010722058A0102100152156F7074696F6E616C507265636F6E646974696F6E7322550A1A577269746552656C6174696F6E7368697073526573706F6E736512370A0A7772697474656E5F617418012001280B32182E617574687A65642E6170692E76312E5A6564546F6B656E52097772697474656E417422DB020A1A44656C65746552656C6174696F6E736869707352657175657374125D0A1372656C6174696F6E736869705F66696C74657218012001280B32222E617574687A65642E6170692E76312E52656C6174696F6E7368697046696C7465724208FA42058A01021001521272656C6174696F6E7368697046696C74657212620A166F7074696F6E616C5F707265636F6E646974696F6E7318022003280B321C2E617574687A65642E6170692E76312E507265636F6E646974696F6E420DFA420A92010722058A0102100152156F7074696F6E616C507265636F6E646974696F6E7312310A0E6F7074696F6E616C5F6C696D697418032001280D420AFA42072A0518E8072800520D6F7074696F6E616C4C696D697412470A206F7074696F6E616C5F616C6C6F775F7061727469616C5F64656C6574696F6E73180420012808521D6F7074696F6E616C416C6C6F775061727469616C44656C6574696F6E7322B7020A1B44656C65746552656C6174696F6E7368697073526573706F6E736512370A0A64656C657465645F617418012001280B32182E617574687A65642E6170692E76312E5A6564546F6B656E520964656C65746564417412690A1164656C6574696F6E5F70726F677265737318022001280E323C2E617574687A65642E6170692E76312E44656C65746552656C6174696F6E7368697073526573706F6E73652E44656C6574696F6E50726F6772657373521064656C6574696F6E50726F677265737322740A1044656C6574696F6E50726F677265737312210A1D44454C4554494F4E5F50524F47524553535F554E5350454349464945441000121E0A1A44454C4554494F4E5F50524F47524553535F434F4D504C4554451001121D0A1944454C4554494F4E5F50524F47524553535F5041525449414C100222ED020A16436865636B5065726D697373696F6E52657175657374123D0A0B636F6E73697374656E637918012001280B321B2E617574687A65642E6170692E76312E436F6E73697374656E6379520B636F6E73697374656E637912450A087265736F7572636518022001280B321F2E617574687A65642E6170692E76312E4F626A6563745265666572656E63654208FA42058A0102100152087265736F75726365124A0A0A7065726D697373696F6E180320012809422AFA42277225284032215E285B612D7A5D5B612D7A302D395F5D7B312C36327D5B612D7A302D395D293F24520A7065726D697373696F6E12440A077375626A65637418042001280B32202E617574687A65642E6170692E76312E5375626A6563745265666572656E63654208FA42058A0102100152077375626A656374123B0A07636F6E7465787418052001280B32172E676F6F676C652E70726F746F6275662E5374727563744208FA42058A010210005207636F6E7465787422C8030A17436865636B5065726D697373696F6E526573706F6E736512410A0A636865636B65645F617418012001280B32182E617574687A65642E6170692E76312E5A6564546F6B656E4208FA42058A010210005209636865636B65644174126A0A0E7065726D697373696F6E7368697018022001280E32362E617574687A65642E6170692E76312E436865636B5065726D697373696F6E526573706F6E73652E5065726D697373696F6E73686970420AFA420782010410012000520E7065726D697373696F6E73686970125B0A137061727469616C5F6361766561745F696E666F18032001280B32212E617574687A65642E6170692E76312E5061727469616C436176656174496E666F4208FA42058A0102100052117061727469616C436176656174496E666F22A0010A0E5065726D697373696F6E73686970121E0A1A5045524D495353494F4E534849505F554E535045434946494544100012200A1C5045524D495353494F4E534849505F4E4F5F5045524D495353494F4E100112210A1D5045524D495353494F4E534849505F4841535F5045524D495353494F4E100212290A255045524D495353494F4E534849505F434F4E444954494F4E414C5F5045524D495353494F4E100322EF010A1B457870616E645065726D697373696F6E5472656552657175657374123D0A0B636F6E73697374656E637918012001280B321B2E617574687A65642E6170692E76312E436F6E73697374656E6379520B636F6E73697374656E637912450A087265736F7572636518022001280B321F2E617574687A65642E6170692E76312E4F626A6563745265666572656E63654208FA42058A0102100152087265736F75726365124A0A0A7065726D697373696F6E180320012809422AFA42277225284032215E285B612D7A5D5B612D7A302D395F5D7B312C36327D5B612D7A302D395D293F24520A7065726D697373696F6E22A2010A1C457870616E645065726D697373696F6E54726565526573706F6E736512390A0B657870616E6465645F617418012001280B32182E617574687A65642E6170692E76312E5A6564546F6B656E520A657870616E646564417412470A09747265655F726F6F7418022001280B322A2E617574687A65642E6170692E76312E5065726D697373696F6E52656C6174696F6E7368697054726565520874726565526F6F742293040A164C6F6F6B75705265736F757263657352657175657374123D0A0B636F6E73697374656E637918012001280B321B2E617574687A65642E6170692E76312E436F6E73697374656E6379520B636F6E73697374656E6379127A0A147265736F757263655F6F626A6563745F747970651802200128094248FA42457243288001323E5E285B612D7A5D5B612D7A302D395F5D7B312C36317D5B612D7A302D395D2F292A5B612D7A5D5B612D7A302D395F5D7B312C36327D5B612D7A302D395D2452127265736F757263654F626A6563745479706512470A0A7065726D697373696F6E1803200128094227FA422472222840321E5E5B612D7A5D5B612D7A302D395F5D7B312C36327D5B612D7A302D395D24520A7065726D697373696F6E12440A077375626A65637418042001280B32202E617574687A65642E6170692E76312E5375626A6563745265666572656E63654208FA42058A0102100152077375626A656374123B0A07636F6E7465787418052001280B32172E676F6F676C652E70726F746F6275662E5374727563744208FA42058A010210005207636F6E7465787412310A0E6F7074696F6E616C5F6C696D697418062001280D420AFA42072A0518E8072800520D6F7074696F6E616C4C696D6974123F0A0F6F7074696F6E616C5F637572736F7218072001280B32162E617574687A65642E6170692E76312E437572736F72520E6F7074696F6E616C437572736F722282030A174C6F6F6B75705265736F7572636573526573706F6E7365123A0A0C6C6F6F6B65645F75705F617418012001280B32182E617574687A65642E6170692E76312E5A6564546F6B656E520A6C6F6F6B656455704174122C0A127265736F757263655F6F626A6563745F696418022001280952107265736F757263654F626A656374496412580A0E7065726D697373696F6E7368697018032001280E32242E617574687A65642E6170692E76312E4C6F6F6B75705065726D697373696F6E73686970420AFA420782010410012000520E7065726D697373696F6E73686970125B0A137061727469616C5F6361766561745F696E666F18042001280B32212E617574687A65642E6170692E76312E5061727469616C436176656174496E666F4208FA42058A0102100052117061727469616C436176656174496E666F12460A1361667465725F726573756C745F637572736F7218052001280B32162E617574687A65642E6170692E76312E437572736F7252116166746572526573756C74437572736F7222ED060A154C6F6F6B75705375626A6563747352657175657374123D0A0B636F6E73697374656E637918012001280B321B2E617574687A65642E6170692E76312E436F6E73697374656E6379520B636F6E73697374656E637912450A087265736F7572636518022001280B321F2E617574687A65642E6170692E76312E4F626A6563745265666572656E63654208FA42058A0102100152087265736F75726365124A0A0A7065726D697373696F6E180320012809422AFA42277225284032215E285B612D7A5D5B612D7A302D395F5D7B312C36327D5B612D7A302D395D293F24520A7065726D697373696F6E12780A137375626A6563745F6F626A6563745F747970651804200128094248FA42457243288001323E5E285B612D7A5D5B612D7A302D395F5D7B312C36317D5B612D7A302D395D2F292A5B612D7A5D5B612D7A302D395F5D7B312C36327D5B612D7A302D395D2452117375626A6563744F626A6563745479706512660A196F7074696F6E616C5F7375626A6563745F72656C6174696F6E180520012809422AFA42277225284032215E285B612D7A5D5B612D7A302D395F5D7B312C36327D5B612D7A302D395D293F2452176F7074696F6E616C5375626A65637452656C6174696F6E123B0A07636F6E7465787418062001280B32172E676F6F676C652E70726F746F6275662E5374727563744208FA42058A010210005207636F6E7465787412420A176F7074696F6E616C5F636F6E63726574655F6C696D697418072001280D420AFA42072A0518E807280052156F7074696F6E616C436F6E63726574654C696D6974123F0A0F6F7074696F6E616C5F637572736F7218082001280B32162E617574687A65642E6170692E76312E437572736F72520E6F7074696F6E616C437572736F72125D0A0F77696C64636172645F6F7074696F6E18092001280E32342E617574687A65642E6170692E76312E4C6F6F6B75705375626A65637473526571756573742E57696C64636172644F7074696F6E520E77696C64636172644F7074696F6E227F0A0E57696C64636172644F7074696F6E121F0A1B57494C44434152445F4F5054494F4E5F554E535045434946494544100012250A2157494C44434152445F4F5054494F4E5F494E434C5544455F57494C444341524453100112250A2157494C44434152445F4F5054494F4E5F4558434C5544455F57494C444341524453100222C6040A164C6F6F6B75705375626A65637473526573706F6E7365123A0A0C6C6F6F6B65645F75705F617418012001280B32182E617574687A65642E6170692E76312E5A6564546F6B656E520A6C6F6F6B656455704174122E0A117375626A6563745F6F626A6563745F696418022001280942021801520F7375626A6563744F626A656374496412340A146578636C756465645F7375626A6563745F6964731803200328094202180152126578636C756465645375626A656374496473125A0A0E7065726D697373696F6E7368697018042001280E32242E617574687A65642E6170692E76312E4C6F6F6B75705065726D697373696F6E73686970420C1801FA420782010410012000520E7065726D697373696F6E73686970125D0A137061727469616C5F6361766561745F696E666F18052001280B32212E617574687A65642E6170692E76312E5061727469616C436176656174496E666F420A1801FA42058A0102100052117061727469616C436176656174496E666F12390A077375626A65637418062001280B321F2E617574687A65642E6170692E76312E5265736F6C7665645375626A65637452077375626A656374124C0A116578636C756465645F7375626A6563747318072003280B321F2E617574687A65642E6170692E76312E5265736F6C7665645375626A65637452106578636C756465645375626A6563747312460A1361667465725F726573756C745F637572736F7218082001280B32162E617574687A65642E6170692E76312E437572736F7252116166746572526573756C74437572736F7222F4010A0F5265736F6C7665645375626A656374122A0A117375626A6563745F6F626A6563745F6964180120012809520F7375626A6563744F626A656374496412580A0E7065726D697373696F6E7368697018022001280E32242E617574687A65642E6170692E76312E4C6F6F6B75705065726D697373696F6E73686970420AFA420782010410012000520E7065726D697373696F6E73686970125B0A137061727469616C5F6361766561745F696E666F18032001280B32212E617574687A65642E6170692E76312E5061727469616C436176656174496E666F4208FA42058A0102100052117061727469616C436176656174496E666F2A99010A144C6F6F6B75705065726D697373696F6E7368697012250A214C4F4F4B55505F5045524D495353494F4E534849505F554E535045434946494544100012280A244C4F4F4B55505F5045524D495353494F4E534849505F4841535F5045524D495353494F4E100112300A2C4C4F4F4B55505F5045524D495353494F4E534849505F434F4E444954494F4E414C5F5045524D495353494F4E10023280080A125065726D697373696F6E7353657276696365128D010A115265616452656C6174696F6E736869707312282E617574687A65642E6170692E76312E5265616452656C6174696F6E7368697073526571756573741A292E617574687A65642E6170692E76312E5265616452656C6174696F6E7368697073526573706F6E7365222182D3E493021B22162F76312F72656C6174696F6E73686970732F726561643A012A3001128F010A12577269746552656C6174696F6E736869707312292E617574687A65642E6170692E76312E577269746552656C6174696F6E7368697073526571756573741A2A2E617574687A65642E6170692E76312E577269746552656C6174696F6E7368697073526573706F6E7365222282D3E493021C22172F76312F72656C6174696F6E73686970732F77726974653A012A1293010A1344656C65746552656C6174696F6E7368697073122A2E617574687A65642E6170692E76312E44656C65746552656C6174696F6E7368697073526571756573741A2B2E617574687A65642E6170692E76312E44656C65746552656C6174696F6E7368697073526573706F6E7365222382D3E493021D22182F76312F72656C6174696F6E73686970732F64656C6574653A012A1284010A0F436865636B5065726D697373696F6E12262E617574687A65642E6170692E76312E436865636B5065726D697373696F6E526571756573741A272E617574687A65642E6170692E76312E436865636B5065726D697373696F6E526573706F6E7365222082D3E493021A22152F76312F7065726D697373696F6E732F636865636B3A012A1294010A14457870616E645065726D697373696F6E54726565122B2E617574687A65642E6170692E76312E457870616E645065726D697373696F6E54726565526571756573741A2C2E617574687A65642E6170692E76312E457870616E645065726D697373696F6E54726565526573706F6E7365222182D3E493021B22162F76312F7065726D697373696F6E732F657870616E643A012A128A010A0F4C6F6F6B75705265736F757263657312262E617574687A65642E6170692E76312E4C6F6F6B75705265736F7572636573526571756573741A272E617574687A65642E6170692E76312E4C6F6F6B75705265736F7572636573526573706F6E7365222482D3E493021E22192F76312F7065726D697373696F6E732F7265736F75726365733A012A30011286010A0E4C6F6F6B75705375626A6563747312252E617574687A65642E6170692E76312E4C6F6F6B75705375626A65637473526571756573741A262E617574687A65642E6170692E76312E4C6F6F6B75705375626A65637473526573706F6E7365222382D3E493021D22182F76312F7065726D697373696F6E732F7375626A656374733A012A300142480A12636F6D2E617574687A65642E6170692E76315A326769746875622E636F6D2F617574687A65642F617574687A65642D676F2F70726F746F2F617574687A65642F6170692F7631620670726F746F33";

public isolated client class PermissionsServiceClient {
    *grpc:AbstractClientEndpoint;

    private final grpc:Client grpcClient;

    public isolated function init(string url, *grpc:ClientConfiguration config) returns grpc:Error? {
        self.grpcClient = check new (url, config);
        check self.grpcClient.initStub(self, PERMISSION_SERVICE_DESC);
    }

    isolated remote function WriteRelationships(WriteRelationshipsRequest|ContextWriteRelationshipsRequest req) returns WriteRelationshipsResponse|grpc:Error {
        map<string|string[]> headers = {};
        WriteRelationshipsRequest message;
        if req is ContextWriteRelationshipsRequest {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("authzed.api.v1.PermissionsService/WriteRelationships", message, headers);
        [anydata, map<string|string[]>] [result, _] = payload;
        return <WriteRelationshipsResponse>result;
    }

    isolated remote function WriteRelationshipsContext(WriteRelationshipsRequest|ContextWriteRelationshipsRequest req) returns ContextWriteRelationshipsResponse|grpc:Error {
        map<string|string[]> headers = {};
        WriteRelationshipsRequest message;
        if req is ContextWriteRelationshipsRequest {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("authzed.api.v1.PermissionsService/WriteRelationships", message, headers);
        [anydata, map<string|string[]>] [result, respHeaders] = payload;
        return {content: <WriteRelationshipsResponse>result, headers: respHeaders};
    }

    isolated remote function DeleteRelationships(DeleteRelationshipsRequest|ContextDeleteRelationshipsRequest req) returns DeleteRelationshipsResponse|grpc:Error {
        map<string|string[]> headers = {};
        DeleteRelationshipsRequest message;
        if req is ContextDeleteRelationshipsRequest {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("authzed.api.v1.PermissionsService/DeleteRelationships", message, headers);
        [anydata, map<string|string[]>] [result, _] = payload;
        return <DeleteRelationshipsResponse>result;
    }

    isolated remote function DeleteRelationshipsContext(DeleteRelationshipsRequest|ContextDeleteRelationshipsRequest req) returns ContextDeleteRelationshipsResponse|grpc:Error {
        map<string|string[]> headers = {};
        DeleteRelationshipsRequest message;
        if req is ContextDeleteRelationshipsRequest {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("authzed.api.v1.PermissionsService/DeleteRelationships", message, headers);
        [anydata, map<string|string[]>] [result, respHeaders] = payload;
        return {content: <DeleteRelationshipsResponse>result, headers: respHeaders};
    }

    isolated remote function CheckPermission(CheckPermissionRequest|ContextCheckPermissionRequest req) returns CheckPermissionResponse|grpc:Error {
        map<string|string[]> headers = {};
        CheckPermissionRequest message;
        if req is ContextCheckPermissionRequest {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("authzed.api.v1.PermissionsService/CheckPermission", message, headers);
        [anydata, map<string|string[]>] [result, _] = payload;
        return <CheckPermissionResponse>result;
    }

    isolated remote function CheckPermissionContext(CheckPermissionRequest|ContextCheckPermissionRequest req) returns ContextCheckPermissionResponse|grpc:Error {
        map<string|string[]> headers = {};
        CheckPermissionRequest message;
        if req is ContextCheckPermissionRequest {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("authzed.api.v1.PermissionsService/CheckPermission", message, headers);
        [anydata, map<string|string[]>] [result, respHeaders] = payload;
        return {content: <CheckPermissionResponse>result, headers: respHeaders};
    }

    isolated remote function ExpandPermissionTree(ExpandPermissionTreeRequest|ContextExpandPermissionTreeRequest req) returns ExpandPermissionTreeResponse|grpc:Error {
        map<string|string[]> headers = {};
        ExpandPermissionTreeRequest message;
        if req is ContextExpandPermissionTreeRequest {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("authzed.api.v1.PermissionsService/ExpandPermissionTree", message, headers);
        [anydata, map<string|string[]>] [result, _] = payload;
        return <ExpandPermissionTreeResponse>result;
    }

    isolated remote function ExpandPermissionTreeContext(ExpandPermissionTreeRequest|ContextExpandPermissionTreeRequest req) returns ContextExpandPermissionTreeResponse|grpc:Error {
        map<string|string[]> headers = {};
        ExpandPermissionTreeRequest message;
        if req is ContextExpandPermissionTreeRequest {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("authzed.api.v1.PermissionsService/ExpandPermissionTree", message, headers);
        [anydata, map<string|string[]>] [result, respHeaders] = payload;
        return {content: <ExpandPermissionTreeResponse>result, headers: respHeaders};
    }

    isolated remote function ReadRelationships(ReadRelationshipsRequest|ContextReadRelationshipsRequest req) returns stream<ReadRelationshipsResponse, grpc:Error?>|grpc:Error {
        map<string|string[]> headers = {};
        ReadRelationshipsRequest message;
        if req is ContextReadRelationshipsRequest {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeServerStreaming("authzed.api.v1.PermissionsService/ReadRelationships", message, headers);
        [stream<anydata, grpc:Error?>, map<string|string[]>] [result, _] = payload;
        ReadRelationshipsResponseStream outputStream = new ReadRelationshipsResponseStream(result);
        return new stream<ReadRelationshipsResponse, grpc:Error?>(outputStream);
    }

    isolated remote function ReadRelationshipsContext(ReadRelationshipsRequest|ContextReadRelationshipsRequest req) returns ContextReadRelationshipsResponseStream|grpc:Error {
        map<string|string[]> headers = {};
        ReadRelationshipsRequest message;
        if req is ContextReadRelationshipsRequest {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeServerStreaming("authzed.api.v1.PermissionsService/ReadRelationships", message, headers);
        [stream<anydata, grpc:Error?>, map<string|string[]>] [result, respHeaders] = payload;
        ReadRelationshipsResponseStream outputStream = new ReadRelationshipsResponseStream(result);
        return {content: new stream<ReadRelationshipsResponse, grpc:Error?>(outputStream), headers: respHeaders};
    }

    isolated remote function LookupResources(LookupResourcesRequest|ContextLookupResourcesRequest req) returns stream<LookupResourcesResponse, grpc:Error?>|grpc:Error {
        map<string|string[]> headers = {};
        LookupResourcesRequest message;
        if req is ContextLookupResourcesRequest {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeServerStreaming("authzed.api.v1.PermissionsService/LookupResources", message, headers);
        [stream<anydata, grpc:Error?>, map<string|string[]>] [result, _] = payload;
        LookupResourcesResponseStream outputStream = new LookupResourcesResponseStream(result);
        return new stream<LookupResourcesResponse, grpc:Error?>(outputStream);
    }

    isolated remote function LookupResourcesContext(LookupResourcesRequest|ContextLookupResourcesRequest req) returns ContextLookupResourcesResponseStream|grpc:Error {
        map<string|string[]> headers = {};
        LookupResourcesRequest message;
        if req is ContextLookupResourcesRequest {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeServerStreaming("authzed.api.v1.PermissionsService/LookupResources", message, headers);
        [stream<anydata, grpc:Error?>, map<string|string[]>] [result, respHeaders] = payload;
        LookupResourcesResponseStream outputStream = new LookupResourcesResponseStream(result);
        return {content: new stream<LookupResourcesResponse, grpc:Error?>(outputStream), headers: respHeaders};
    }

    isolated remote function LookupSubjects(LookupSubjectsRequest|ContextLookupSubjectsRequest req) returns stream<LookupSubjectsResponse, grpc:Error?>|grpc:Error {
        map<string|string[]> headers = {};
        LookupSubjectsRequest message;
        if req is ContextLookupSubjectsRequest {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeServerStreaming("authzed.api.v1.PermissionsService/LookupSubjects", message, headers);
        [stream<anydata, grpc:Error?>, map<string|string[]>] [result, _] = payload;
        LookupSubjectsResponseStream outputStream = new LookupSubjectsResponseStream(result);
        return new stream<LookupSubjectsResponse, grpc:Error?>(outputStream);
    }

    isolated remote function LookupSubjectsContext(LookupSubjectsRequest|ContextLookupSubjectsRequest req) returns ContextLookupSubjectsResponseStream|grpc:Error {
        map<string|string[]> headers = {};
        LookupSubjectsRequest message;
        if req is ContextLookupSubjectsRequest {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeServerStreaming("authzed.api.v1.PermissionsService/LookupSubjects", message, headers);
        [stream<anydata, grpc:Error?>, map<string|string[]>] [result, respHeaders] = payload;
        LookupSubjectsResponseStream outputStream = new LookupSubjectsResponseStream(result);
        return {content: new stream<LookupSubjectsResponse, grpc:Error?>(outputStream), headers: respHeaders};
    }
}

public class ReadRelationshipsResponseStream {
    private stream<anydata, grpc:Error?> anydataStream;

    public isolated function init(stream<anydata, grpc:Error?> anydataStream) {
        self.anydataStream = anydataStream;
    }

    public isolated function next() returns record {|ReadRelationshipsResponse value;|}|grpc:Error? {
        var streamValue = self.anydataStream.next();
        if (streamValue is ()) {
            return streamValue;
        } else if (streamValue is grpc:Error) {
            return streamValue;
        } else {
            record {|ReadRelationshipsResponse value;|} nextRecord = {value: <ReadRelationshipsResponse>streamValue.value};
            return nextRecord;
        }
    }

    public isolated function close() returns grpc:Error? {
        return self.anydataStream.close();
    }
}

public class LookupResourcesResponseStream {
    private stream<anydata, grpc:Error?> anydataStream;

    public isolated function init(stream<anydata, grpc:Error?> anydataStream) {
        self.anydataStream = anydataStream;
    }

    public isolated function next() returns record {|LookupResourcesResponse value;|}|grpc:Error? {
        var streamValue = self.anydataStream.next();
        if (streamValue is ()) {
            return streamValue;
        } else if (streamValue is grpc:Error) {
            return streamValue;
        } else {
            record {|LookupResourcesResponse value;|} nextRecord = {value: <LookupResourcesResponse>streamValue.value};
            return nextRecord;
        }
    }

    public isolated function close() returns grpc:Error? {
        return self.anydataStream.close();
    }
}

public class LookupSubjectsResponseStream {
    private stream<anydata, grpc:Error?> anydataStream;

    public isolated function init(stream<anydata, grpc:Error?> anydataStream) {
        self.anydataStream = anydataStream;
    }

    public isolated function next() returns record {|LookupSubjectsResponse value;|}|grpc:Error? {
        var streamValue = self.anydataStream.next();
        if (streamValue is ()) {
            return streamValue;
        } else if (streamValue is grpc:Error) {
            return streamValue;
        } else {
            record {|LookupSubjectsResponse value;|} nextRecord = {value: <LookupSubjectsResponse>streamValue.value};
            return nextRecord;
        }
    }

    public isolated function close() returns grpc:Error? {
        return self.anydataStream.close();
    }
}

public type ContextLookupResourcesResponseStream record {|
    stream<LookupResourcesResponse, error?> content;
    map<string|string[]> headers;
|};

public type ContextReadRelationshipsResponseStream record {|
    stream<ReadRelationshipsResponse, error?> content;
    map<string|string[]> headers;
|};

public type ContextLookupSubjectsResponseStream record {|
    stream<LookupSubjectsResponse, error?> content;
    map<string|string[]> headers;
|};

public type ContextLookupSubjectsRequest record {|
    LookupSubjectsRequest content;
    map<string|string[]> headers;
|};

public type ContextWriteRelationshipsResponse record {|
    WriteRelationshipsResponse content;
    map<string|string[]> headers;
|};

public type ContextCheckPermissionRequest record {|
    CheckPermissionRequest content;
    map<string|string[]> headers;
|};

public type ContextCheckPermissionResponse record {|
    CheckPermissionResponse content;
    map<string|string[]> headers;
|};

public type ContextLookupResourcesResponse record {|
    LookupResourcesResponse content;
    map<string|string[]> headers;
|};

public type ContextWriteRelationshipsRequest record {|
    WriteRelationshipsRequest content;
    map<string|string[]> headers;
|};

public type ContextDeleteRelationshipsResponse record {|
    DeleteRelationshipsResponse content;
    map<string|string[]> headers;
|};

public type ContextDeleteRelationshipsRequest record {|
    DeleteRelationshipsRequest content;
    map<string|string[]> headers;
|};

public type ContextExpandPermissionTreeRequest record {|
    ExpandPermissionTreeRequest content;
    map<string|string[]> headers;
|};

public type ContextReadRelationshipsResponse record {|
    ReadRelationshipsResponse content;
    map<string|string[]> headers;
|};

public type ContextExpandPermissionTreeResponse record {|
    ExpandPermissionTreeResponse content;
    map<string|string[]> headers;
|};

public type ContextLookupResourcesRequest record {|
    LookupResourcesRequest content;
    map<string|string[]> headers;
|};

public type ContextLookupSubjectsResponse record {|
    LookupSubjectsResponse content;
    map<string|string[]> headers;
|};

public type ContextReadRelationshipsRequest record {|
    ReadRelationshipsRequest content;
    map<string|string[]> headers;
|};

@protobuf:Descriptor {value: PERMISSION_SERVICE_DESC}
public type LookupSubjectsRequest record {|
    Consistency consistency = {};
    ObjectReference 'resource = {};
    string permission = "";
    string subject_object_type = "";
    string optional_subject_relation = "";
    map<anydata> context = {};
    int optional_concrete_limit = 0;
    Cursor optional_cursor = {};
    LookupSubjectsRequest_WildcardOption wildcard_option = WILDCARD_OPTION_UNSPECIFIED;
|};

public enum LookupSubjectsRequest_WildcardOption {
    WILDCARD_OPTION_UNSPECIFIED, WILDCARD_OPTION_INCLUDE_WILDCARDS, WILDCARD_OPTION_EXCLUDE_WILDCARDS
}

@protobuf:Descriptor {value: PERMISSION_SERVICE_DESC}
public type WriteRelationshipsResponse record {|
    ZedToken written_at = {};
|};

@protobuf:Descriptor {value: PERMISSION_SERVICE_DESC}
public type CheckPermissionRequest record {|
    // Consistency consistency = {};
    ObjectReference 'resource = {};
    string permission = "";
    SubjectReference subject = {};
    map<anydata> context = {};
|};

@protobuf:Descriptor {value: PERMISSION_SERVICE_DESC}
public type Precondition record {|
    Precondition_Operation operation = OPERATION_UNSPECIFIED;
    RelationshipFilter filter = {};
|};

public enum Precondition_Operation {
    OPERATION_UNSPECIFIED, OPERATION_MUST_NOT_MATCH, OPERATION_MUST_MATCH
}

@protobuf:Descriptor {value: PERMISSION_SERVICE_DESC}
public type Consistency record {|
    boolean minimize_latency?;
    ZedToken at_least_as_fresh?;
    ZedToken at_exact_snapshot?;
    boolean fully_consistent?;
|};

isolated function isValidConsistency(Consistency r) returns boolean {
    int requirementCount = 0;
    if !(r?.minimize_latency is ()) {
        requirementCount += 1;
    }
    if !(r?.at_least_as_fresh is ()) {
        requirementCount += 1;
    }
    if !(r?.at_exact_snapshot is ()) {
        requirementCount += 1;
    }
    if !(r?.fully_consistent is ()) {
        requirementCount += 1;
    }
    if (requirementCount > 1) {
        return false;
    }
    return true;
}

isolated function setConsistency_MinimizeLatency(Consistency r, boolean minimize_latency) {
    r.minimize_latency = minimize_latency;
    _ = r.removeIfHasKey("at_least_as_fresh");
    _ = r.removeIfHasKey("at_exact_snapshot");
    _ = r.removeIfHasKey("fully_consistent");
}

isolated function setConsistency_AtLeastAsFresh(Consistency r, ZedToken at_least_as_fresh) {
    r.at_least_as_fresh = at_least_as_fresh;
    _ = r.removeIfHasKey("minimize_latency");
    _ = r.removeIfHasKey("at_exact_snapshot");
    _ = r.removeIfHasKey("fully_consistent");
}

isolated function setConsistency_AtExactSnapshot(Consistency r, ZedToken at_exact_snapshot) {
    r.at_exact_snapshot = at_exact_snapshot;
    _ = r.removeIfHasKey("minimize_latency");
    _ = r.removeIfHasKey("at_least_as_fresh");
    _ = r.removeIfHasKey("fully_consistent");
}

isolated function setConsistency_FullyConsistent(Consistency r, boolean fully_consistent) {
    r.fully_consistent = fully_consistent;
    _ = r.removeIfHasKey("minimize_latency");
    _ = r.removeIfHasKey("at_least_as_fresh");
    _ = r.removeIfHasKey("at_exact_snapshot");
}

@protobuf:Descriptor {value: PERMISSION_SERVICE_DESC}
public type CheckPermissionResponse record {|
    ZedToken checked_at = {};
    CheckPermissionResponse_Permissionship permissionship = PERMISSIONSHIP_UNSPECIFIED;
    PartialCaveatInfo partial_caveat_info = {};
|};

public enum CheckPermissionResponse_Permissionship {
    PERMISSIONSHIP_UNSPECIFIED, PERMISSIONSHIP_NO_PERMISSION, PERMISSIONSHIP_HAS_PERMISSION, PERMISSIONSHIP_CONDITIONAL_PERMISSION
}

@protobuf:Descriptor {value: PERMISSION_SERVICE_DESC}
public type LookupResourcesResponse record {|
    ZedToken looked_up_at = {};
    string resource_object_id = "";
    LookupPermissionship permissionship = LOOKUP_PERMISSIONSHIP_UNSPECIFIED;
    PartialCaveatInfo partial_caveat_info = {};
    Cursor after_result_cursor = {};
|};

@protobuf:Descriptor {value: PERMISSION_SERVICE_DESC}
public type WriteRelationshipsRequest record {|
    RelationshipUpdate[] updates = [];
    Precondition[] optional_preconditions = [];
|};

@protobuf:Descriptor {value: PERMISSION_SERVICE_DESC}
public type ResolvedSubject record {|
    string subject_object_id = "";
    LookupPermissionship permissionship = LOOKUP_PERMISSIONSHIP_UNSPECIFIED;
    PartialCaveatInfo partial_caveat_info = {};
|};

@protobuf:Descriptor {value: PERMISSION_SERVICE_DESC}
public type DeleteRelationshipsResponse record {|
    ZedToken deleted_at = {};
    DeleteRelationshipsResponse_DeletionProgress deletion_progress = DELETION_PROGRESS_UNSPECIFIED;
|};

public enum DeleteRelationshipsResponse_DeletionProgress {
    DELETION_PROGRESS_UNSPECIFIED, DELETION_PROGRESS_COMPLETE, DELETION_PROGRESS_PARTIAL
}

@protobuf:Descriptor {value: PERMISSION_SERVICE_DESC}
public type SubjectFilter record {|
    string subject_type = "";
    string optional_subject_id = "";
    SubjectFilter_RelationFilter optional_relation = {};
|};

@protobuf:Descriptor {value: PERMISSION_SERVICE_DESC}
public type SubjectFilter_RelationFilter record {|
    string relation = "";
|};

@protobuf:Descriptor {value: PERMISSION_SERVICE_DESC}
public type DeleteRelationshipsRequest record {|
    RelationshipFilter relationship_filter = {};
    Precondition[] optional_preconditions = [];
    int optional_limit = 0;
    boolean optional_allow_partial_deletions = false;
|};

@protobuf:Descriptor {value: PERMISSION_SERVICE_DESC}
public type RelationshipFilter record {|
    string resource_type = "";
    string optional_resource_id = "";
    string optional_relation = "";
    SubjectFilter optional_subject_filter = {};
|};

@protobuf:Descriptor {value: PERMISSION_SERVICE_DESC}
public type ExpandPermissionTreeRequest record {|
    Consistency consistency = {};
    ObjectReference 'resource = {};
    string permission = "";
|};

@protobuf:Descriptor {value: PERMISSION_SERVICE_DESC}
public type ReadRelationshipsResponse record {|
    ZedToken read_at = {};
    Relationship relationship = {};
    Cursor after_result_cursor = {};
|};

@protobuf:Descriptor {value: PERMISSION_SERVICE_DESC}
public type ExpandPermissionTreeResponse record {|
    ZedToken expanded_at = {};
    PermissionRelationshipTree tree_root = {};
|};

@protobuf:Descriptor {value: PERMISSION_SERVICE_DESC}
public type LookupResourcesRequest record {|
    Consistency consistency = {};
    string resource_object_type = "";
    string permission = "";
    SubjectReference subject = {};
    map<anydata> context = {};
    int optional_limit = 0;
    Cursor optional_cursor = {};
|};

@protobuf:Descriptor {value: PERMISSION_SERVICE_DESC}
public type LookupSubjectsResponse record {|
    ZedToken looked_up_at = {};
    string subject_object_id = "";
    string[] excluded_subject_ids = [];
    LookupPermissionship permissionship = LOOKUP_PERMISSIONSHIP_UNSPECIFIED;
    PartialCaveatInfo partial_caveat_info = {};
    ResolvedSubject subject = {};
    ResolvedSubject[] excluded_subjects = [];
    Cursor after_result_cursor = {};
|};

@protobuf:Descriptor {value: PERMISSION_SERVICE_DESC}
public type ReadRelationshipsRequest record {|
    Consistency consistency = {};
    RelationshipFilter relationship_filter = {};
    int optional_limit = 0;
    Cursor optional_cursor = {};
|};

public enum LookupPermissionship {
    LOOKUP_PERMISSIONSHIP_UNSPECIFIED, LOOKUP_PERMISSIONSHIP_HAS_PERMISSION, LOOKUP_PERMISSIONSHIP_CONDITIONAL_PERMISSION
}

