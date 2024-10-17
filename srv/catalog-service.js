const cds = require('@sap/cds');

module.exports = class CatalogService extends cds.ApplicationService {

   init () {

        const {Headers, Items} = this.entities;

        //before
        //on
        //after

        this.before('NEW', Headers.drafts, async (req)=>{
            //console.log("Entering a Order Sale");
            //console.log("REQ");
            //console.log(req);
            const oSearch = await SELECT.one.from(Headers).columns(`max(ID) as Max`);
            //console.log("Resultado");
            //console.log(oSearch);
            req.data.ID = String(Number(oSearch.Max) + 1);
            req.data.Country = 'ES';
            
        });

        this.before('NEW', Items.drafts, async (req)=>{
            //console.log("Entering a Order Position");
            //console.log("REQ");
            //console.log(req);
            const oSearch = await SELECT.one.from(Items.drafts).columns(`max(Position) as Max`).where({ ID: req.data.ID});
            //console.log("Resultado");
            //console.log(oSearch);
            req.data.Position = String(Number(oSearch.Max) + 1);
            req.data.UnitOfMeasure = "CM";
            req.data.currency = 'EUR';
            
        });

        return super.init();

   }

};