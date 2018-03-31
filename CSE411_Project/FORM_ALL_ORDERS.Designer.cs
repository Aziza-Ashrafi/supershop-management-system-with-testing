namespace CSE411_Project
{
    partial class FORM_ALL_ORDERS
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.DGV_ALL_ORDERS = new System.Windows.Forms.DataGridView();
            this.BTN_PRINT_ORDER = new System.Windows.Forms.Button();
            this.PANEL_CLOSE = new System.Windows.Forms.Panel();
            this.PANEL_MIN = new System.Windows.Forms.Panel();
            ((System.ComponentModel.ISupportInitialize)(this.DGV_ALL_ORDERS)).BeginInit();
            this.SuspendLayout();
            // 
            // DGV_ALL_ORDERS
            // 
            this.DGV_ALL_ORDERS.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.Fill;
            this.DGV_ALL_ORDERS.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.DGV_ALL_ORDERS.Location = new System.Drawing.Point(36, 248);
            this.DGV_ALL_ORDERS.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.DGV_ALL_ORDERS.Name = "DGV_ALL_ORDERS";
            this.DGV_ALL_ORDERS.SelectionMode = System.Windows.Forms.DataGridViewSelectionMode.FullRowSelect;
            this.DGV_ALL_ORDERS.Size = new System.Drawing.Size(906, 565);
            this.DGV_ALL_ORDERS.TabIndex = 0;
            // 
            // BTN_PRINT_ORDER
            // 
            this.BTN_PRINT_ORDER.BackColor = System.Drawing.Color.Black;
            this.BTN_PRINT_ORDER.FlatAppearance.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(46)))), ((int)(((byte)(178)))), ((int)(((byte)(255)))));
            this.BTN_PRINT_ORDER.FlatAppearance.MouseDownBackColor = System.Drawing.Color.FromArgb(((int)(((byte)(255)))), ((int)(((byte)(189)))), ((int)(((byte)(74)))));
            this.BTN_PRINT_ORDER.FlatAppearance.MouseOverBackColor = System.Drawing.Color.FromArgb(((int)(((byte)(46)))), ((int)(((byte)(178)))), ((int)(((byte)(255)))));
            this.BTN_PRINT_ORDER.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.BTN_PRINT_ORDER.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.BTN_PRINT_ORDER.ForeColor = System.Drawing.Color.White;
            this.BTN_PRINT_ORDER.Location = new System.Drawing.Point(663, 175);
            this.BTN_PRINT_ORDER.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.BTN_PRINT_ORDER.Name = "BTN_PRINT_ORDER";
            this.BTN_PRINT_ORDER.Size = new System.Drawing.Size(279, 46);
            this.BTN_PRINT_ORDER.TabIndex = 1;
            this.BTN_PRINT_ORDER.Text = "Print Selected Order";
            this.BTN_PRINT_ORDER.UseVisualStyleBackColor = false;
            this.BTN_PRINT_ORDER.Click += new System.EventHandler(this.BTN_PRINT_ORDER_Click);
            // 
            // PANEL_CLOSE
            // 
            this.PANEL_CLOSE.BackColor = System.Drawing.Color.Transparent;
            this.PANEL_CLOSE.Location = new System.Drawing.Point(874, 43);
            this.PANEL_CLOSE.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.PANEL_CLOSE.Name = "PANEL_CLOSE";
            this.PANEL_CLOSE.Size = new System.Drawing.Size(62, 63);
            this.PANEL_CLOSE.TabIndex = 2;
            this.PANEL_CLOSE.Click += new System.EventHandler(this.PANEL_CLOSE_Click);
            this.PANEL_CLOSE.Paint += new System.Windows.Forms.PaintEventHandler(this.PANEL_CLOSE_Paint);
            // 
            // PANEL_MIN
            // 
            this.PANEL_MIN.BackColor = System.Drawing.Color.Transparent;
            this.PANEL_MIN.Location = new System.Drawing.Point(790, 45);
            this.PANEL_MIN.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.PANEL_MIN.Name = "PANEL_MIN";
            this.PANEL_MIN.Size = new System.Drawing.Size(62, 63);
            this.PANEL_MIN.TabIndex = 3;
            this.PANEL_MIN.Click += new System.EventHandler(this.PANEL_MIN_Click);
            // 
            // FORM_ALL_ORDERS
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(9F, 20F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackgroundImage = global::CSE411_Project.Properties.Resources.Print_Order;
            this.ClientSize = new System.Drawing.Size(1181, 846);
            this.Controls.Add(this.PANEL_MIN);
            this.Controls.Add(this.PANEL_CLOSE);
            this.Controls.Add(this.BTN_PRINT_ORDER);
            this.Controls.Add(this.DGV_ALL_ORDERS);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.None;
            this.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.Name = "FORM_ALL_ORDERS";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "FORM_ALL_ORDERS";
            this.Load += new System.EventHandler(this.FORM_ALL_ORDERS_Load);
            ((System.ComponentModel.ISupportInitialize)(this.DGV_ALL_ORDERS)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.Button BTN_PRINT_ORDER;
        public System.Windows.Forms.DataGridView DGV_ALL_ORDERS;
        private System.Windows.Forms.Panel PANEL_CLOSE;
        private System.Windows.Forms.Panel PANEL_MIN;
    }
}